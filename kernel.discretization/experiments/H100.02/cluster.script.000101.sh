#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/02.Credit.Aproval/config/Database.02.01.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/1/ ../../experiments/02.Credit.Aproval/results.01/01/ ../../experiments/02.Credit.Aproval/results.01/01/ 100
cd /home/jlflores/kernel.discretization
