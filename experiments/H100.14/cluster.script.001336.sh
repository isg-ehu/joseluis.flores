#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/14.Appendicitis/config/Database.14.06.csv ../../bbdd/14.Appendicitis/03.Final.SCV/4/ ../../experiments/14.Appendicitis/results.04/06/ ../../experiments/14.Appendicitis/results.04/06/ 100
cd /home/jlflores/kernel.discretization
