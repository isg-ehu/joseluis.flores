#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.08.csv ../../bbdd/03.German.Credit/03.Final.SCV/7/ ../../experiments/03.German.Credit/results.07/08/ ../../experiments/03.German.Credit/results.07/08/ 100
cd /home/jlflores/kernel.discretization
