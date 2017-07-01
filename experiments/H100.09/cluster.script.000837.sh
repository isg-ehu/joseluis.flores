#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/09.SPECT.Heart/config/Database.09.07.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/4/ ../../experiments/09.SPECT.Heart/results.04/07/ ../../experiments/09.SPECT.Heart/results.04/07/ 100
cd /home/jlflores/kernel.discretization
