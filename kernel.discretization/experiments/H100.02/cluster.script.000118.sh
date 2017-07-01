#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/02.Credit.Aproval/config/Database.02.08.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/2/ ../../experiments/02.Credit.Aproval/results.02/08/ ../../experiments/02.Credit.Aproval/results.02/08/ 100 &
cd /home/jlflores/kernel.discretization
