#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/09.SPECT.Heart/config/Database.09.04.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/7/ ../../experiments/09.SPECT.Heart/results.07/04/ ../../experiments/09.SPECT.Heart/results.07/04/ 100
cd /home/jlflores/kernel.discretization
