

pdf(file='././metal_vocab_BDk_RTT_plots.pdf',width=12, height=8)
par(mfrow=c(2,4))
library(scales)
###metal_vocab_BDk_mcmc###

#Number Shifts
unique=c(2.0, 3.0,4.0,5.0,6.0)
counts=c(28, 614,145,10,3)
plot(unique,counts,type = 'h', xlim = c(0,7.0), ylab = 'Frequency', xlab = 'n. shifts',lwd=5,col='#4c4cec')
#Speciation rate Plot
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
rate=c(0.158539246287, 0.155532953658,0.154975439745,0.152436432637,0.146380034029,0.14131129899,0.140592193397,0.140314870647,0.140389529666,0.140376345013,0.13968309039,0.138795678101,0.137959765719,0.137240336041,0.13494319574,0.130879718712,0.127979687829,0.124216020161,0.109724041509,0.0798978330829,0.0775762824675,0.077010525252,0.0753511251566,0.0728460495721,0.0725247376066,0.0723116720573,0.0721751542833,0.0461759832128,0.0154172215458,0.015334416332,0.0154062459395,0.0154062459395)
minHPD=c(0.0936701500108, 0.0808542257987,0.0831497817073,0.0857787102804,0.0862057559765,0.0862057559765,0.0884662712874,0.0884662712874,0.0884662712874,0.0862057559765,0.0864476859117,0.0864476859117,0.0860377385955,0.085268411586,0.0849349448861,0.0735680629155,0.0735680629155,0.0680824251096,0.0608491309034,0.0504467009125,0.0523066194273,0.0504467009125,0.047154993435,0.0509779582525,0.0514750315886,0.0509779582525,0.0504274662044,0.00537222062203,0.00575627955772,0.00591144112353,0.00591144112353,0.00591144112353)
maxHPD=c(0.306748328945, 0.251919874105,0.251919874105,0.241774858558,0.199300329185,0.187315616411,0.187958065761,0.18872899452,0.18872899452,0.186081397815,0.185416543579,0.183632129519,0.183632129519,0.183632129519,0.187831035945,0.177944414782,0.177944414782,0.173148746701,0.1725474085,0.125404614736,0.118536811374,0.115327822588,0.106093630031,0.0996023802455,0.0991544120949,0.0996023802455,0.0995143370631,0.0888898552674,0.0269359961775,0.0269359961775,0.0272517414462,0.0272517414462)
plot(time,time,type = 'n', ylim = c(0, 0.337423161839), xlim = c(1968.0,2000.5), ylab = 'Speciation rate', xlab = 'Time (AD)',main='metal_vocab_BDk_mcmc' )
polygon(c(time, rev(time)), c(maxHPD, rev(minHPD)), col = alpha('#4c4cec',0.3), border = NA)
lines(time,rate, col = '#4c4cec', lwd=2)
#Frequency of shifts
mids=c(1968.52419355, 1969.57258065,1970.62096774,1971.66935484,1972.71774194,1973.76612903,1974.81451613,1975.86290323,1976.91129032,1977.95967742,1979.00806452,1980.05645161,1981.10483871,1982.15322581,1983.2016129,1984.25,1985.2983871,1986.34677419,1987.39516129,1988.44354839,1989.49193548,1990.54032258,1991.58870968,1992.63709677,1993.68548387,1994.73387097,1995.78225806,1996.83064516,1997.87903226,1998.92741935,1999.97580645)
counts=c(0.0025, 0.015,0.0075,0.02625,0.0425,0.03125,0.0125,0.01,0.01,0.0125,0.01,0.0125,0.01125,0.015,0.05875,0.04,0.055,0.04875,0.535,0.09625,0.01875,0.01125,0.07,0.01375,0.01125,0.00375,0.22875,0.7575,0.00625,0.00875,0.0)
plot(mids,counts,type = 'h', xlim = c(1968.0,2000.5), ylim=c(0,0.7575), ylab = 'Frequency of rate shift', xlab = 'Time (AD)',lwd=5,col='#4c4cec')
bf2 = 0.0743899834186
bf6 = 0.372587643358
abline(h=bf2, lty=2)
abline(h=bf6, lty=2)
#Net Rate
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
net_rate=c(0.150168277887, 0.148572488512,0.149938334064,0.149228302622,0.143678212143,0.138647844927,0.138115052561,0.138000565575,0.13810143358,0.138103745743,0.137464160745,0.136600880503,0.135787813051,0.135074491012,0.132777350711,0.128712441494,0.125846354571,0.122083813568,0.107591834915,0.0777656264892,0.0754440758738,0.0748783186582,0.0732189185629,0.0707035553328,0.0703822433673,0.070169177818,0.0700302438041,0.0440225361051,0.013229067976,0.0130362874825,0.0127905954768,0.0127905954768)
net_minHPD=c(0.0534529863597, 0.0511491698753,0.073020346368,0.073020346368,0.0776320866294,0.0841609732966,0.0857901175942,0.0857901175942,0.0857901175942,0.0857901175942,0.0858441667627,0.0857901175942,0.0858441667627,0.0852995332565,0.0833347981721,0.0705449794784,0.0710554847442,0.0645757457417,0.0576046661537,0.0487026814656,0.0507309143079,0.0487026814656,0.0439216233343,0.0487026814656,0.0487026814656,0.0487026814656,0.0487026814656,0.00387244236187,0.00304853479897,0.0020322611224,0.00225755008558,0.00225755008558)
net_maxHPD=c(0.313031554581, 0.284263312879,0.290662469844,0.239670547942,0.194325206786,0.186641718691,0.185224924663,0.185224924663,0.185224924663,0.184426467412,0.184426467412,0.183937257504,0.184426467412,0.184426467412,0.185224924663,0.174488411097,0.174488411097,0.170351323208,0.170483507432,0.122957266078,0.117010300357,0.113998837901,0.103128652938,0.0976604697171,0.0970915181803,0.0976604697171,0.0981046146559,0.0882896008398,0.025820648509,0.0244551560619,0.0256986398238,0.0256986398238)
plot(time,time,type = 'n', ylim = c(0, 0.344334710039), xlim = c(1968.0,2000.5), ylab = 'Net Rate', xlab = 'Time (AD)',lwd=2, main='', col= '#32CD32' )
polygon(c(time, rev(time)), c(net_maxHPD, rev(net_minHPD)), col = alpha('#32CD32',0.3), border = NA)
lines(time,net_rate, col = '#32CD32', lwd=2)
abline(h=0,lty=2)

#Number Shifts
unique=c(1.0, 2.0,3.0)
counts=c(657, 138,5)
plot(unique,counts,type = 'h', xlim = c(0,7.0), ylab = 'Frequency', xlab = 'n. shifts',lwd=5,col='#e34a33')
#Extinction rate Plot
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
rate=c(0.00837096839918, 0.00696046514609,0.0050371056814,0.0032081300154,0.00270182188583,0.0026634540633,0.00247714083553,0.00231430507253,0.00228809608565,0.00227259926978,0.00221892964527,0.00219479759821,0.00217195266848,0.00216584502943,0.00216584502943,0.00216727721853,0.00213333325776,0.00213220659376,0.00213220659376,0.00213220659376,0.00213220659376,0.00213220659376,0.00213220659376,0.00214249423932,0.00214249423932,0.00214249423932,0.00214491047922,0.00215344710774,0.00218815356982,0.00229812884946,0.00261565046279,0.00261565046279)
minHPD=c(0.000163369169245, 0.000163369169245,0.000163369169245,0.0001559689943,0.000273733477749,0.0001559689943,0.000490686866904,0.000526328595428,0.000526328595428,0.000555264970568,0.000598678543263,0.000490686866904,0.000530986350854,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000555264970568,0.000530986350854,0.000530986350854,0.000530986350854,0.000530986350854,0.000526328595428,0.000573545077166,0.000490686866904,0.000490686866904,0.000490686866904)
maxHPD=c(0.0469133622611, 0.0359937367526,0.0188236044588,0.00594762785578,0.00479439957787,0.00460687449678,0.0047457315748,0.00459982216165,0.00453875944295,0.00453875944295,0.00453875944295,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.0044041249812,0.00453875944295,0.00460687449678,0.00548132581609,0.00548132581609)
plot(time,time,type = 'n', ylim = c(0, 0.0516046984872), xlim = c(1968.0,2000.5), ylab = 'Extinction rate', xlab = 'Time (AD)',main='' )
polygon(c(time, rev(time)), c(maxHPD, rev(minHPD)), col = alpha('#e34a33',0.3), border = NA)
lines(time,rate, col = '#e34a33', lwd=2)
#Frequency of shifts
mids=c(1968.52419355, 1969.57258065,1970.62096774,1971.66935484,1972.71774194,1973.76612903,1974.81451613,1975.86290323,1976.91129032,1977.95967742,1979.00806452,1980.05645161,1981.10483871,1982.15322581,1983.2016129,1984.25,1985.2983871,1986.34677419,1987.39516129,1988.44354839,1989.49193548,1990.54032258,1991.58870968,1992.63709677,1993.68548387,1994.73387097,1995.78225806,1996.83064516,1997.87903226,1998.92741935,1999.97580645)
counts=c(0.0025, 0.0225,0.03875,0.01875,0.01625,0.0025,0.01,0.005,0.005,0.005,0.0,0.0025,0.00375,0.0,0.0,0.00375,0.0025,0.0,0.0,0.0,0.0,0.0,0.0,0.00125,0.0,0.00125,0.0025,0.00625,0.01125,0.02375,0.0)
plot(mids,counts,type = 'h', xlim = c(1968.0,2000.5), ylim=c(0,0.2), ylab = 'Frequency of rate shift', xlab = 'Time (AD)',lwd=5,col='#e34a33')
abline(h=bf2, lty=2)
abline(h=bf6, lty=2)
#Net Diversity
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
net_diversity=c(3.0, 4.0,6.0,8.0,10.0,10.0,10.0,11.0,12.0,17.0,20.0,23.0,27.0,32.0,39.0,42.0,49.0,54.0,65.0,68.0,73.0,79.0,90.0,94.0,102.0,105.0,114.0,123.0,123.0,124.0,125.5,127.5)
plot(time,net_diversity,type = 'l', ylab = 'Net Diversity', xlab = 'Time (AD)',lwd=2, main='', col= '#32CD32' )


n <- dev.off()