#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/10.Banknote.Authentication/config/Database.10.08.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/7/ ../../experiments/10.Banknote.Authentication/results.07/08/ ../../experiments/10.Banknote.Authentication/results.07/08/ 100
cd /home/jlflores/kernel.discretization
