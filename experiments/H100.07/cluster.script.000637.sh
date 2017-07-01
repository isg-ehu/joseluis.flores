#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.07.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/4/ ../../experiments/07.Bupa.Liver.Disorders/results.04/07/ ../../experiments/07.Bupa.Liver.Disorders/results.04/07/ 100
cd /home/jlflores/kernel.discretization
