#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.02.csv ../../bbdd/03.German.Credit/03.Final.SCV/4/ ../../experiments/03.German.Credit/results.04/02/ ../../experiments/03.German.Credit/results.04/02/ 100 &
cd /home/jlflores/kernel.discretization
