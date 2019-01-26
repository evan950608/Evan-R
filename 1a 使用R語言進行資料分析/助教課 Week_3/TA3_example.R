## Function
#1
y1 <- function(x){
  return (x+3)
}

y1(5)

#2
y2 <- function(x, y, z){
  return (x+y+z)
}

y2(5, 5, 7)

#3 Fibonacci sequence
fibonacci <- function(n){
  if ((n == 1) | (n == 2)){
    return (1)
  } else {
    return (fibonacci(n-2) + fibonacci(n-1))
  }
}

fibonacci(10)
for(i in 1:10){
  print(fibonacci(i))
}

# HELP!
help(max)
?seq
args(dbinom)

## Package
install.packages("dplyr")
library(dplyr)
require(dplyr)
help(dplyr)







