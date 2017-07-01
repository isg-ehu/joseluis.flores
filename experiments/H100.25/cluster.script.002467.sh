#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.07.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/7/ ../../experiments/25.Leukemia.Haslinger/results.07/07/ ../../experiments/25.Leukemia.Haslinger/results.07/07/ 100
cd /home/jlflores/kernel.discretization
