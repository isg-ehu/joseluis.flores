#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/14.Appendicitis/config/Database.14.07.csv ../../bbdd/14.Appendicitis/03.Final.SCV/1/ ../../experiments/14.Appendicitis/results.01/07/ ../../experiments/14.Appendicitis/results.01/07/ 100
cd /home/jlflores/kernel.discretization
