import os
import sys
import argparse
import numpy as np
import pandas as pd
import glob
from literate_library import print_R_vec, calcHPD, parse_ts_te, core_arguments, create_bins

p= core_arguments()
p.add_argument('input_dir', type=str, default='.', help="directory of DDRate logs")
p.add_argument('-o', nargs='?', type=argparse.FileType('w'), default=sys.stdout)
p.add_argument('-head',type=int,help="Header?",default=1,metavar=1)
p.add_argument('-combine', metavar='0',type=int,help="Whether log files should be combined before plotting or plotted serially")
p.add_argument('-burnin', metavar='.2',type=float,help='set as a fraction',default=.2)

args=p.parse_args()
if args.head==True: head=0
else: head=None

#parse input and log file to put together vectors of interest
def make_vec_dict(input_file):
    vec_dict={}

    vec_dict['time']=TIME_RANGE
    vec_dict['net_diversity']=DT
    vec_dict['emp_birth']=N_SPEC/DT; vec_dict['emp_birth'][0]=None
    vec_dict['emp_death']=N_EXTI/DT; vec_dict['emp_death'][0]=None
    
    logs=pd.read_csv(input_file,sep='\t',header=head)

    birth_means=[];birth_minHPD=[]; birth_maxHPD=[]

    for col in logs:
        if col.find('l_')==-1 or col[-1].isalpha()==True: continue
        birth_means.append(np.mean(logs[col]))
        minHPDc,maxHPDc=calcHPD(logs[col])
        birth_minHPD.append(minHPDc); birth_maxHPD.append(maxHPDc)

    vec_dict['birth_rate']=birth_means
    vec_dict['birth_minHPD']=birth_minHPD
    vec_dict['birth_maxHPD']=birth_maxHPD

        
    death_means=[];death_minHPD=[]; death_maxHPD=[]

    for col in logs:
        if col.find('m_')==-1 or col[-1].isalpha()==True: continue
        death_means.append(np.mean(logs[col]))
        minHPDc,maxHPDc=calcHPD(logs[col])
        death_minHPD.append(minHPDc); death_maxHPD.append(maxHPDc)

    vec_dict['death_rate']=death_means
    vec_dict['death_minHPD']=death_minHPD
    vec_dict['death_maxHPD']=death_maxHPD
    
    niche_means=[]; niche_minHPD=[]; niche_maxHPD=[]
    for col in logs:
        if col.find('niche_')==-1 or col.find('_frac')!=-1: continue
        niche_means.append(np.mean(logs[col]))
        minHPDc,maxHPDc=calcHPD(logs[col])
        niche_minHPD.append(minHPDc); niche_maxHPD.append(maxHPDc)

    vec_dict['niche']=niche_means
    vec_dict['niche_minHPD']=niche_minHPD
    vec_dict['niche_maxHPD']=niche_maxHPD
    
    return vec_dict

        
def ggplot_rates(vec_dict,out_path):
    out_str=''
    out_str+="library('ggplot2')\nlibrary('gridExtra')\n"
    for v in vec_dict: out_str += print_R_vec('\n'+v,vec_dict[v])
    out_str+='\n\nrates.dat<-data.frame('+','.join(vec_dict.keys())+')\n'
    out_str+="\nrate_plot<-ggplot(rates.dat, aes(time,birth_rate)) +\n\
    geom_line(size=.7,col='blue') +\n\
    geom_line(aes(time,death_rate),col='red',size=.7) +\n \
    scale_color_manual(values = c('blue','red')) +\n\
    scale_x_continuous(breaks=seq({0},{1},5),minor_breaks=seq({0},{1},1)) +\n\
    scale_y_continuous(breaks=seq({2},{3},.1),limits = c({2},{3})) + \n\
    geom_ribbon(aes_string(ymin=birth_minHPD,ymax=birth_maxHPD,fill=shQuote('red')),alpha=.2,col=NA)+ \n\
    geom_ribbon(aes_string(ymin=death_minHPD,ymax=death_maxHPD,fill=shQuote('blue')),alpha=.2,col=NA)+\n\
    geom_line(aes(time,emp_birth,col='eb'),size=.5,linetype = 'dashed')+\n\
    geom_line(aes(time,emp_death,col='ed'),size=.5,linetype = 'dashed')+\n\
    theme(legend.position = 'none')+\n\
    labs(x='Time',y='Rates')\n\n\n".format(ORIGIN,
                               PRESENT,
                                min(np.amin(vec_dict['birth_minHPD']), np.amax(vec_dict['death_minHPD']),np.amax(vec_dict['emp_birth']),np.amax(vec_dict['emp_death']), 0 ) // 0.1 * 0.1, 
                               max(np.amax(vec_dict['birth_maxHPD']), np.amax(vec_dict['death_maxHPD']),np.amax(vec_dict['emp_birth']),np.amax(vec_dict['emp_death']) )// 0.1 * 0.1 
                                )
    #NET DIVERSITY PLOT
    out_str+="div_plot<-ggplot(rates.dat,aes(time,net_diversity))+\n\
      geom_line(aes(time,net_diversity,col='Net Diversity'),col='dark green',size=.5,linetype = 'dashed')+\n\
      geom_line(aes(time,niche,col='Carrying Capacity'),size=.5) +\n\
      scale_x_continuous(breaks=seq({0},{1},5),minor_breaks=seq({0},{1},1)) +\n\
      geom_ribbon(aes(ymin=niche_minHPD,ymax=niche_maxHPD,fill='Carrying Capacity'),alpha=.30,col=NA) +\n\
      theme(legend.position = 'none')+\n\
      labs(x='Time',y='Number of Lineages')\n".format(ORIGIN,PRESENT)
    out_str+="fig<-grid.arrange(rate_plot,div_plot,nrow = 2,ncol=1)\n"
    out_str+="ggsave(file='{0}/DDRate_plot.pdf', plot=fig)\n".format(out_path)
    
    if out_path[-1]=='/': out_path=out_path[:-1]
    with open(out_path+'/DDRate_plot.r','w') as f: f.write(out_str)
    os.system("Rscript "+out_path+'/DDRate_plot.r')
    
def combine_logs(mcmc_files, wd, burnin_pct):
    #MCMC (w/header)
    mcmc_files=list(mcmc_files)
    total_log=[]
    for file_name in mcmc_files:
        with open(file_name) as f:
            file_log=f.readlines()
            header=file_log[0]
            burnin=int(burnin_pct*len(file_log[1:]))
            total_log+=file_log[burnin+1:]
    with open(wd+'/COMBINED_mcmc.log','w') as o:
        o.write(header)
        it_bool= (header.split('\t')[0]=='it')
        for i,l in enumerate(total_log):
            l=l.split('\t')
            l[0]=str(i)
            o.write('\t'.join(l))
direct="%s/*.log" % (args.input_dir) 
files=glob.glob(direct)
files.sort()
if args.combine==1:
    print("Combining directory to 1 log...\n")
    combine_logs(files,args.input_dir,args.burnin)
    files=[args.input_dir+'/COMBINED_mcmc.log']

TS,TE,PRESENT,ORIGIN=parse_ts_te(args.d,args.TBP,args.first_year,args.last_year,args.death_jitter)
ORIGIN, PRESENT, N_SPEC, N_EXTI, DT, N_TIME_BINS, TIME_RANGE=create_bins(ORIGIN, PRESENT,TS,TE,args.rm_first_bin)

vec_dict=make_vec_dict(files[0])
ggplot_rates(vec_dict,args.input_dir)