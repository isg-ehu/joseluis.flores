#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/20.Indian.Liver.Patient/config/Database.20.08.csv ../../bbdd/20.Indian.Liver.Patient/03.Final.SCV/6/ ../../experiments/20.Indian.Liver.Patient/results.06/08/ ../../experiments/20.Indian.Liver.Patient/results.06/08/ 100
cd /home/jlflores/kernel.discretization
