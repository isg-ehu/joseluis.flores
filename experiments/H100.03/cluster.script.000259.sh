#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/03.German.Credit/config/Database.03.09.csv ../../bbdd/03.German.Credit/03.Final.SCV/6/ ../../experiments/03.German.Credit/results.06/09/ ../../experiments/03.German.Credit/results.06/09/ 100 &
cd /home/jlflores/kernel.discretization
