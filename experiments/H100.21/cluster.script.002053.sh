#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/21.Vertebral.Column/config/Database.21.03.csv ../../bbdd/21.Vertebral.Column/03.Final.SCV/6/ ../../experiments/21.Vertebral.Column/results.06/03/ ../../experiments/21.Vertebral.Column/results.06/03/ 100
cd /home/jlflores/kernel.discretization

