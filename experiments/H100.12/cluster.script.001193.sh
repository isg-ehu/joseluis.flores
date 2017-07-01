#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/12.Climate.Simulation.Crashes/config/Database.12.03.csv ../../bbdd/12.Climate.Simulation.Crashes/03.Final.SCV/10/ ../../experiments/12.Climate.Simulation.Crashes/results.10/03/ ../../experiments/12.Climate.Simulation.Crashes/results.10/03/ 100
cd /home/jlflores/kernel.discretization

