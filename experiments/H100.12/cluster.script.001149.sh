#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/12.Climate.Simulation.Crashes/config/Database.12.09.csv ../../bbdd/12.Climate.Simulation.Crashes/03.Final.SCV/5/ ../../experiments/12.Climate.Simulation.Crashes/results.05/09/ ../../experiments/12.Climate.Simulation.Crashes/results.05/09/ 100
cd /home/jlflores/kernel.discretization
