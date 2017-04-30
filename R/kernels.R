#source("finite.integral.R")

# K Rectangular 
ISG_K_Rectangular<-function(x,x_i,h)
{
  k<-0
  if (abs(x_i-x)<=h) k<-1
  return(k)
}

ISG_K_Epanechnikov<-function(x,x_i,h)
{
  k<-0
  if (abs(x_i-x) <= h) k<-(3/4)*(1-((x-x_i)/(h))^2)
  return (k)
}


ISG_K_f<-function(point,kernel=c("epanechnikov","rectangular"),bw,n,x_min,x_max)
{
  aux<-0
  x_vector<-seq(from=x_min,to=x_max,length.out=n)
  y_vector<-rep(0,length.out=length(x_vector))
  indexes=which(x_vector<=(point+bw) & x_vector>=(point-bw)) ## NEW PATCH for OPTIMIZATION Purposes
  i=indexes[1]
  if (kernel=="epanechnikov") {
    for(x in x_vector[indexes]) {
      aux=ISG_K_Epanechnikov(x,point,bw)
      y_vector[i]=y_vector[i]+aux
      i=i+1
    }
  }
  if (kernel=="rectangular" ) {
    for(x in x_vector[indexes]) {
      aux=ISG_K_Rectangular (x,point,bw)
      y_vector[i]=y_vector[i]+aux
      i=i+1
    }    
  }
  result<-list(x_vector,y_vector)
  return(result)
}

ISG_density<-function(dataset,kernel=c("epanechnikov","rectangular"),bw,n,x_min,x_max)
{
  density_result_x<-seq(from=x_min,to=x_max,length.out=n)
  density_result_y<-rep(0,length.out=length(density_result_x))
  for(i in 1:length(dataset)) {
    value=ISG_K_f(dataset[i],kernel,bw,n,x_min,x_max)[[2]]
    density_result_y<-density_result_y+value
  }
  denominator = (bw*length(dataset))
  density_result_y=density_result_y/denominator
  return(list(density_result_x,density_result_y))  
}

# x20160531<-c(0)
# x_density20160531<-ISG_density(x20160531,kernel="epanechnikov",1,1000,-3,3)
# plot(x_density20160531[[1]],x_density20160531[[2]],type='l')
# grid()
# print("ISG R/Kernel density functions")
# result20160531<-max(x_density20160531[[2]])
# expectedResult20160531<-0.75
# if ((result20160531-expectedResult20160531)<1e-07) {
#   print("-> Unit test 1. Correct")
# } else {
#   print("-> Unit test 1. Fail")
# }
# result20160531<-ISG_integral(x_density20160531[[1]],x_density20160531[[2]])
# expectedResult20160531<-1
# if (abs(result20160531-expectedResult20160531)<1e-04) {
#   print("-> Unit test 2. Correct")
# } else {
#   print("-> Unit test 2. Fail")
# }