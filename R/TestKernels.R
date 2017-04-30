source("R/kernels.R")
source("R/ISGIntegral.R")

x_plus =c(1,1,1,1,5,5,5,5)
x_plus = runif(10,min=0,max=100)
x_minus=c(3,3,3,3,7,7,7,7)
x_minus = runif(10,min=0,max=100)

x_plus = c(43.536999,32.428146,4.704181,86.543053,35.619991,96.786597,16.885177,56.639274,88.148435,69.984368)
x_minus = c(98.25115,47.16505,34.26199,77.13294,61.23612,10.02633,84.74071,60.44801,81.22854,47.12621)

x_plus = runif(400,min=0,max=100)
x_minus = runif(200,min=0,max=100)

x_plus=sort(x_plus)
x_minus=sort(x_minus)

h_ref=3.5
h_plus=h_ref
n_plus=length(x_plus)
n_minus=length(x_minus)
fraction=n_plus/n_minus
h_minus=fraction*h_plus
kernel_samples=6000

min_X=min(x_plus,x_minus)-max(h_plus,h_minus)
max_X=max(x_plus,x_minus)+max(h_plus,h_minus)
t1 <- Sys.time()
PLUS_density    = ISG_density(x_plus ,kernel="epanechnikov",h_plus ,kernel_samples,min_X,max_X)
MINUS_density   = ISG_density(x_minus,kernel="epanechnikov",h_minus,kernel_samples,min_X,max_X)  
t2 <- Sys.time()
print(t1)
print(t2)
print(t2-t1)
PLUS_density_x  = PLUS_density  [[1]]
PLUS_density_y  = PLUS_density  [[2]]
MINUS_density_y = MINUS_density [[2]] 

plot(PLUS_density_x,PLUS_density_y,type='l',col='red',main=paste("Red: +, Blue:-"))
lines(PLUS_density_x,MINUS_density_y,type='l',col='blue')
grid()

print(ISGIntegral(PLUS_density_x,PLUS_density_y))
print(ISGIntegral(PLUS_density_x,MINUS_density_y))