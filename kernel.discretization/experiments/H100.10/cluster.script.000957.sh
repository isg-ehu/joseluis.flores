#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/10.Banknote.Authentication/config/Database.10.07.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/6/ ../../experiments/10.Banknote.Authentication/results.06/07/ ../../experiments/10.Banknote.Authentication/results.06/07/ 100
cd /home/jlflores/kernel.discretization
