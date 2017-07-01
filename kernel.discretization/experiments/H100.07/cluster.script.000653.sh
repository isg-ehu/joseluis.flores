#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.03.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/6/ ../../experiments/07.Bupa.Liver.Disorders/results.06/03/ ../../experiments/07.Bupa.Liver.Disorders/results.06/03/ 100
cd /home/jlflores/kernel.discretization

