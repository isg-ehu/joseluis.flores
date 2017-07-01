#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.01.csv ../../bbdd/03.German.Credit/03.Final.SCV/4/ ../../experiments/03.German.Credit/results.04/01/ ../../experiments/03.German.Credit/results.04/01/ 100 &
cd /home/jlflores/kernel.discretization
