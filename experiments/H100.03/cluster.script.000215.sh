#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.05.csv ../../bbdd/03.German.Credit/03.Final.SCV/2/ ../../experiments/03.German.Credit/results.02/05/ ../../experiments/03.German.Credit/results.02/05/ 100 &
cd /home/jlflores/kernel.discretization
