#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/09.SPECT.Heart/config/Database.09.08.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/10/ ../../experiments/09.SPECT.Heart/results.10/08/ ../../experiments/09.SPECT.Heart/results.10/08/ 100
cd /home/jlflores/kernel.discretization
