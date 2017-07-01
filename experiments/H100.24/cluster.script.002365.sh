#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/24.Heart.Desease.Hungarian/config/Database.24.05.csv ../../bbdd/24.Heart.Desease.Hungarian/03.Final.SCV/7/ ../../experiments/24.Heart.Desease.Hungarian/results.07/05/ ../../experiments/24.Heart.Desease.Hungarian/results.07/05/ 100
cd /home/jlflores/kernel.discretization
