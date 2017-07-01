#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/12.Climate.Simulation.Crashes/config/Database.12.06.csv ../../bbdd/12.Climate.Simulation.Crashes/03.Final.SCV/7/ ../../experiments/12.Climate.Simulation.Crashes/results.07/06/ ../../experiments/12.Climate.Simulation.Crashes/results.07/06/ 100
cd /home/jlflores/kernel.discretization
