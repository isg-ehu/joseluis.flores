#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.02.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/9/ ../../experiments/25.Leukemia.Haslinger/results.09/02/ ../../experiments/25.Leukemia.Haslinger/results.09/02/ 100
cd /home/jlflores/kernel.discretization
