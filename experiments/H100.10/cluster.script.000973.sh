#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/10.Banknote.Authentication/config/Database.10.03.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/8/ ../../experiments/10.Banknote.Authentication/results.08/03/ ../../experiments/10.Banknote.Authentication/results.08/03/ 100
cd /home/jlflores/kernel.discretization

