#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/20.Indian.Liver.Patient/config/Database.20.06.csv ../../bbdd/20.Indian.Liver.Patient/03.Final.SCV/7/ ../../experiments/20.Indian.Liver.Patient/results.07/06/ ../../experiments/20.Indian.Liver.Patient/results.07/06/ 100
cd /home/jlflores/kernel.discretization
