K2_Zeros <- function(A,B,C) {
  solutions<-c()
  if ( A == 0.0 ) {
    if ( B != 0.0 ) {
      solutions[1] = -C/B
      solutions[2] = solutions[1]
    }
  } else {
    expr1 = B*B
    expr2 = 4*A*C
    if ( expr1 >= expr2 && A!=0.0 ) {
      rad = expr1-expr2
      sqroot = sqrt(rad)
      numerator1 = -B + sqroot
      numerator2 = -B - sqroot
      denominator <- 2*A
      solutions[1] = numerator1/denominator
      solutions[2] = numerator2/denominator
    }
  }
  return(sort(solutions))
}