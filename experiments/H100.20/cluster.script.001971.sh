#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/20.Indian.Liver.Patient/config/Database.20.01.csv ../../bbdd/20.Indian.Liver.Patient/03.Final.SCV/8/ ../../experiments/20.Indian.Liver.Patient/results.08/01/ ../../experiments/20.Indian.Liver.Patient/results.08/01/ 100
cd /home/jlflores/kernel.discretization
