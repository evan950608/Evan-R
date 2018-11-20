cities <- c("New York", "Paris", "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")
first_and_last <- function(name) {
    name <- gsub(" ", "", name)
    letters <- strsplit(name, split = "")[[1]]
    c(first = min(letters), last = max(letters))
}

first_and_last('New York')
lapply(cities, first_and_last)
sapply(cities, first_and_last)
class(sapply(cities, first_and_last))


unique_letters <- function(name) {
name <- gsub(" ", "", name)
letters <- strsplit(name, split = "")[[1]]
unique(letters)
}
unique_letters('London')
lapply(cities, unique_letters)
sapply(cities, unique_letters)


vapply(cities, nchar, numeric(1))
mat = matrix(rep(c('a','b','c','d'), time=3), byrow=TRUE, nrow=3)
class(mat[,1])
vapply(cities, first_and_last, character(2))

