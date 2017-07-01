#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/24.Heart.Desease.Hungarian/config/Database.24.08.csv ../../bbdd/24.Heart.Desease.Hungarian/03.Final.SCV/5/ ../../experiments/24.Heart.Desease.Hungarian/results.05/08/ ../../experiments/24.Heart.Desease.Hungarian/results.05/08/ 100
cd /home/jlflores/kernel.discretization
