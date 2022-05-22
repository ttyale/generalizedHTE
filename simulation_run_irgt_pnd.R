###############################################################
#### Sample simulation run and output #########################
###############################################################
#load function
source(".../simulation_functions_irgt.R")


#1

start_time <- Sys.time()
delta035_001a<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.75,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(rbind(delta035_001a,delta035_001b),"gug_delta035_001.csv")

#2

start_time <- Sys.time()
delta035_005a<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.75,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(rbind(delta035_005a,delta035_005b),"gug_delta035_005.csv")

#3

source("/Users/tonytong/Dropbox/9.IRGT_HTE/Simulations/simulation_functions.R")
setwd("/Users/tonytong/Dropbox/9.IRGT_HTE/Simulations/IRGT_Simulation_Results")
set.seed(73563)
start_time <- Sys.time()
delta035_010<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=5, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=25, m0=1, p=0.75,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.25,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.50,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.1, rhoy0=0.00, varx=1, vary1=1, vary0=2, m1=50, m0=1, p=0.75,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_010,"gug_delta035_010.csv")

