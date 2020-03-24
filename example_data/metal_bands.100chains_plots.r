

pdf(file='combined/COMBINED_RTT_plots.pdf',width=12, height=8)
par(mfrow=c(2,4))
library(scales)
###COMBINED_mcmc###

#Number Shifts
unique=c(4.0, 5.0,6.0,7.0,8.0,9.0,10.0,11.0)
counts=c(1, 206,25600,35606,9450,1054,80,3)
plot(unique,counts,type = 'h', xlim = c(0,12.0), ylab = 'Frequency', xlab = 'n. shifts',lwd=5,col='#4c4cec')
#Speciation rate Plot
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
rate=c(0.308541206956, 0.305766090851,0.30271176834,0.296352606721,0.291270121064,0.285089567318,0.284556383586,0.284866661572,0.288272092866,0.306570151526,0.359249861181,0.466730898803,0.494756969257,0.49626628907,0.496270119905,0.494085278667,0.467152559718,0.408369673428,0.406418318102,0.382150093426,0.33264728591,0.330833927625,0.329817165018,0.329281793548,0.328335601479,0.304690823639,0.275208515015,0.266294696912,0.247251067127,0.22821574903,0.226381590576,0.22637829463)
minHPD=c(0.174094169641, 0.18294258194,0.17730337252,0.177493941937,0.186521877704,0.190034710793,0.189936343389,0.18949124543,0.183782491565,0.211133140027,0.226088168003,0.295708815071,0.461906793339,0.464268726948,0.464754606311,0.461179759374,0.394616093673,0.386096497692,0.387985487614,0.323986101076,0.320651671914,0.320171787732,0.320531776561,0.320227322185,0.318166792342,0.266722047796,0.261150033484,0.241213464886,0.222848025606,0.220042387243,0.219932555941,0.219842364653)
maxHPD=c(0.500074466736, 0.487510991782,0.461572577145,0.412511364981,0.394365074468,0.381661066793,0.379722349101,0.37968254765,0.386521140039,0.502680664239,0.517830406984,0.530828767713,0.52906617176,0.527221258987,0.527535530576,0.530662704278,0.518594140509,0.428276675135,0.425293425385,0.421185006554,0.350522319903,0.342872618558,0.339351575843,0.338154253097,0.338902030686,0.335471945167,0.289657759649,0.285185949082,0.274080709503,0.244600188442,0.232759233848,0.232673505378)
plot(time,time,type = 'n', ylim = c(0, 0.583911644484), xlim = c(1968.0,2000.5), ylab = 'Speciation rate', xlab = 'Time (AD)',main='COMBINED_mcmc' )
polygon(c(time, rev(time)), c(maxHPD, rev(minHPD)), col = alpha('#4c4cec',0.3), border = NA)
lines(time,rate, col = '#4c4cec', lwd=2)
#Frequency of shifts
mids=c(1968.52419355, 1969.57258065,1970.62096774,1971.66935484,1972.71774194,1973.76612903,1974.81451613,1975.86290323,1976.91129032,1977.95967742,1979.00806452,1980.05645161,1981.10483871,1982.15322581,1983.2016129,1984.25,1985.2983871,1986.34677419,1987.39516129,1988.44354839,1989.49193548,1990.54032258,1991.58870968,1992.63709677,1993.68548387,1994.73387097,1995.78225806,1996.83064516,1997.87903226,1998.92741935,1999.97580645)
counts=c(0.000722222222222, 0.0189583333333,0.0195416666667,0.0275416666667,0.0275416666667,0.0283472222222,0.00963888888889,0.0112638888889,0.0370138888889,0.117277777778,0.387513888889,0.378875,0.093875,0.00704166666667,0.00186111111111,0.0704305555556,0.752986111111,0.180819444444,0.00618055555556,0.949986111111,0.061125,0.0475416666667,0.0352916666667,0.0161388888889,0.259638888889,0.765736111111,0.2545,0.504041666667,0.630236111111,0.100388888889,0.000652777777778)
plot(mids,counts,type = 'h', xlim = c(1968.0,2000.5), ylim=c(0,0.949986111111), ylab = 'Frequency of rate shift', xlab = 'Time (AD)',lwd=5,col='#4c4cec')
bf2 = 0.0748821529989
bf6 = 0.374255002215
abline(h=bf2, lty=2)
abline(h=bf6, lty=2)
#Net Rate
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
net_rate=c(0.273587178562, 0.272791659276,0.271083918593,0.265352503708,0.260532446631,0.254541686962,0.254104205957,0.25437554644,0.25762379588,0.275522791295,0.322733338939,0.40263401655,0.397490641637,0.357083257641,0.349670159568,0.334606710092,0.276111878405,0.212088595473,0.210128015001,0.185862200485,0.136353233855,0.134528592742,0.133509356529,0.132814843442,0.132297340965,0.112132499123,0.0893957861827,0.0873748859007,0.0890564669476,0.0910810911275,0.0935504013031,0.093554879136)
net_minHPD=c(0.111803516543, 0.136377447456,0.136377447456,0.139629934252,0.151046753641,0.153694358349,0.154188607807,0.154949450002,0.148878765286,0.171895013597,0.180185967582,0.227675085171,0.323384272227,0.308444673066,0.301150576602,0.274821545776,0.195370888127,0.188623628485,0.190579169523,0.126117427016,0.121613724298,0.122110976564,0.122609933825,0.122083484605,0.118609932079,0.069032898734,0.068689474171,0.057630059396,0.045190476534,0.066820676429,0.084443500624,0.084422108059)
net_maxHPD=c(0.488840132553, 0.467523519512,0.434009389974,0.385732507164,0.369871326688,0.354804964861,0.353130185468,0.354307892888,0.361117144234,0.473961512959,0.49756349531,0.500684089874,0.480339309083,0.41515616275,0.39617035643,0.388725446052,0.339706132401,0.233042209929,0.22975982796,0.225759145231,0.154660327826,0.147549477139,0.144406541788,0.143442803158,0.148108525063,0.150948678774,0.110825315784,0.116408775325,0.13608693986,0.110183511451,0.103163803407,0.103129614866)
plot(time,time,type = 'n', ylim = c(0, 0.550752498862), xlim = c(1968.0,2000.5), ylab = 'Net Rate', xlab = 'Time (AD)',lwd=2, main='', col= '#32CD32' )
polygon(c(time, rev(time)), c(net_maxHPD, rev(net_minHPD)), col = alpha('#32CD32',0.3), border = NA)
lines(time,net_rate, col = '#32CD32', lwd=2)
abline(h=0,lty=2)

#Number Shifts
unique=c(3.0, 4.0,5.0,6.0,7.0,8.0,9.0)
counts=c(50, 646,38562,26588,5676,455,23)
plot(unique,counts,type = 'h', xlim = c(0,12.0), ylab = 'Frequency', xlab = 'n. shifts',lwd=5,col='#e34a33')
#Extinction rate Plot
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
rate=c(0.0349540283941, 0.0329744315748,0.0316278497469,0.0310001030124,0.0307376744335,0.030547880356,0.0304521776288,0.0304911151322,0.0306482969868,0.0310473602314,0.0365165222417,0.0640968822537,0.0972663276202,0.139183031429,0.146599960336,0.159478568575,0.191040681313,0.196281077954,0.1962903031,0.196287892942,0.196294052055,0.196305334883,0.196307808489,0.196466950105,0.196038260514,0.192558324516,0.185812728833,0.178919811011,0.158194600179,0.137134657902,0.132831189272,0.132823415494)
minHPD=c(0.00223535625675, 0.00306778558976,0.00315311681711,0.00363073779485,0.00344226680086,0.00353753856989,0.00365603074076,0.00365954076011,0.00365603074076,0.00366265326582,0.00186598487394,0.0153155651871,0.0277122568582,0.0828298052267,0.120553794198,0.124539018986,0.154127356384,0.190252975135,0.190349580033,0.190385253941,0.190385253941,0.190402968059,0.190403779972,0.190220740771,0.18889395635,0.177011187188,0.17219819038,0.158425548492,0.131599647209,0.125863527066,0.125734040722,0.125786942351)
maxHPD=c(0.0670193395749, 0.0621443065652,0.0595153652373,0.0585644754701,0.057651267527,0.0571902668977,0.0570130845956,0.0570267657038,0.0573605477853,0.0582709097382,0.0781300540266,0.142893359914,0.157959087108,0.172723381738,0.195459653464,0.201753460624,0.203705265169,0.202253345546,0.202285876763,0.202292759879,0.202284779846,0.202292759879,0.202292759879,0.20244161765,0.203781547068,0.201736464754,0.199016355301,0.197245347716,0.182595462896,0.156888291721,0.139058313635,0.139104437701)
plot(time,time,type = 'n', ylim = c(0, 0.224159701775), xlim = c(1968.0,2000.5), ylab = 'Extinction rate', xlab = 'Time (AD)',main='' )
polygon(c(time, rev(time)), c(maxHPD, rev(minHPD)), col = alpha('#e34a33',0.3), border = NA)
lines(time,rate, col = '#e34a33', lwd=2)
#Frequency of shifts
mids=c(1968.52419355, 1969.57258065,1970.62096774,1971.66935484,1972.71774194,1973.76612903,1974.81451613,1975.86290323,1976.91129032,1977.95967742,1979.00806452,1980.05645161,1981.10483871,1982.15322581,1983.2016129,1984.25,1985.2983871,1986.34677419,1987.39516129,1988.44354839,1989.49193548,1990.54032258,1991.58870968,1992.63709677,1993.68548387,1994.73387097,1995.78225806,1996.83064516,1997.87903226,1998.92741935,1999.97580645)
counts=c(0.00133333333333, 0.021,0.01575,0.0119305555556,0.00884722222222,0.0085,0.00702777777778,0.00761111111111,0.00986111111111,0.0161388888889,0.179652777778,0.310013888889,0.4395,0.266055555556,0.06475,0.587208333333,0.309458333333,0.0348472222222,0.0015,0.000986111111111,0.00181944444444,0.00126388888889,0.003375,0.0214583333333,0.141972222222,0.354875,0.276138888889,0.539361111111,0.661125,0.231236111111,0.00222222222222)
plot(mids,counts,type = 'h', xlim = c(1968.0,2000.5), ylim=c(0,0.661125), ylab = 'Frequency of rate shift', xlab = 'Time (AD)',lwd=5,col='#e34a33')
abline(h=bf2, lty=2)
abline(h=bf6, lty=2)
#Net Diversity
time=c(1968.5078125, 1969.5234375,1970.5390625,1971.5546875,1972.5703125,1973.5859375,1974.6015625,1975.6171875,1976.6328125,1977.6484375,1978.6640625,1979.6796875,1980.6953125,1981.7109375,1982.7265625,1983.7421875,1984.7578125,1985.7734375,1986.7890625,1987.8046875,1988.8203125,1989.8359375,1990.8515625,1991.8671875,1992.8828125,1993.8984375,1994.9140625,1995.9296875,1996.9453125,1997.9609375,1998.9765625,1999.9921875)
net_diversity=c(1.0, 2.0,5.0,8.0,13.0,13.5,16.0,20.0,25.0,35.5,52.0,85.0,145.0,264.0,456.0,767.5,1141.5,1540.5,1949.0,2521.0,3071.5,3657.5,4304.0,5029.5,5859.5,6658.0,7448.0,8263.5,9038.0,9869.0,10924.0,12088.5)
plot(time,net_diversity,type = 'l', ylab = 'Net Diversity', xlab = 'Time (AD)',lwd=2, main='', col= '#32CD32' )


n <- dev.off()