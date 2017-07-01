#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.07.csv ../../bbdd/03.German.Credit/03.Final.SCV/2/ ../../experiments/03.German.Credit/results.02/07/ ../../experiments/03.German.Credit/results.02/07/ 100
cd /home/jlflores/kernel.discretization
