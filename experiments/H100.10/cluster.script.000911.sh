#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/10.Banknote.Authentication/config/Database.10.01.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/2/ ../../experiments/10.Banknote.Authentication/results.02/01/ ../../experiments/10.Banknote.Authentication/results.02/01/ 100
cd /home/jlflores/kernel.discretization
