#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.04.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/1/ ../../experiments/07.Bupa.Liver.Disorders/results.01/04/ ../../experiments/07.Bupa.Liver.Disorders/results.01/04/ 100
cd /home/jlflores/kernel.discretization
