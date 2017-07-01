#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/09.SPECT.Heart/config/Database.09.01.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/5/ ../../experiments/09.SPECT.Heart/results.05/01/ ../../experiments/09.SPECT.Heart/results.05/01/ 100
cd /home/jlflores/kernel.discretization
