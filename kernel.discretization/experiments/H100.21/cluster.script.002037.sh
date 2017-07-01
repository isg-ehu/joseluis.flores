#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/21.Vertebral.Column/config/Database.21.07.csv ../../bbdd/21.Vertebral.Column/03.Final.SCV/4/ ../../experiments/21.Vertebral.Column/results.04/07/ ../../experiments/21.Vertebral.Column/results.04/07/ 100
cd /home/jlflores/kernel.discretization
