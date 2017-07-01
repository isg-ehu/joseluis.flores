#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.05.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/1/ ../../experiments/07.Bupa.Liver.Disorders/results.01/05/ ../../experiments/07.Bupa.Liver.Disorders/results.01/05/ 100
cd /home/jlflores/kernel.discretization
