x <- 1:10
y <- list(a = -3:5, b = -2:8, c = 4:9)

# lapply
# Returns a list
square <- function(x) {
  return(x**2)
}

square_x <- list()

for (i in 1:length(x)){
  square_x[[i]] <- square(x[i])
}
square_x

lapply(x, square)
lapply(x, function(x) {x**2})

lapply(y, mean)

pow <- function(x, p=2) {
  return (x**p)
}

lapply(x, pow)
lapply(x, pow, p=3)

# sapply
# Returns a vector
sapply(x, square)
sapply(y, mean)

# vapply
f <- function(x) {
  return (c(min = min(x), mean = mean(x), max = max(x)))
}

lapply(y, f)
sapply(y, f)
vapply(y, f, numeric(3))
vapply(y, f, numeric(0))

# numeric serves as a 'template'
numeric(3)
logical(2)

for (i in 0:10) {
    cat('Numeric: ', numeric(i), '\n')
    cat('Character: ', character(i), '\n')
    cat('Logical: ', logical(i), '\n')
}







