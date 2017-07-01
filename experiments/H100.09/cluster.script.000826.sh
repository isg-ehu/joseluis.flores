#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/09.SPECT.Heart/config/Database.09.06.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/3/ ../../experiments/09.SPECT.Heart/results.03/06/ ../../experiments/09.SPECT.Heart/results.03/06/ 100
cd /home/jlflores/kernel.discretization
