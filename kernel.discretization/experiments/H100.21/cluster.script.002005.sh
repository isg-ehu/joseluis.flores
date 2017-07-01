#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/21.Vertebral.Column/config/Database.21.05.csv ../../bbdd/21.Vertebral.Column/03.Final.SCV/1/ ../../experiments/21.Vertebral.Column/results.01/05/ ../../experiments/21.Vertebral.Column/results.01/05/ 100
cd /home/jlflores/kernel.discretization
