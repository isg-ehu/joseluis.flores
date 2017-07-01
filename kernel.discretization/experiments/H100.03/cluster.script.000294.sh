#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.04.csv ../../bbdd/03.German.Credit/03.Final.SCV/10/ ../../experiments/03.German.Credit/results.10/04/ ../../experiments/03.German.Credit/results.10/04/ 100
cd /home/jlflores/kernel.discretization
