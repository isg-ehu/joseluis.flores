#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/02.Credit.Aproval/config/Database.02.10.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/10/ ../../experiments/02.Credit.Aproval/results.10/10/ ../../experiments/02.Credit.Aproval/results.10/10/ 100 &
cd /home/jlflores/kernel.discretization
