# ---------------------------------
#
#   2018-10-9 TA Class Example
#  
# ---------------------------------


# read data
data <- read.csv("C:\\Users\\evan9\\OneDrive\\Document\\GitHub\\1a 使用R語言進行資料分析\\助教課 Week2\\grade.csv")

# calculate overall grade with weight mean
weight <- c(1,1,1,1,1)
data$overall <- 0

for (i in row.names(data)){
    data[i, 'overall'] <- sum(data[i, 2:6] * weight / sum(weight))
}


# check if student pass
data$pass <- data$overall >= 60


# ranking student
data <- data.frame('rank'=0, data)
data$rank[order(data$overall)] <- nrow(data):1
#increasing order   Rank: 100 to 1
#order(c())     returns element "index" from low to high (increasing)
#sort(c())      returns element "themselves" from low to high (increasing)

# sort data.frame with ranking
#data[c(35,19, 25, 64), ]
data <- data[order(data$rank),]

# write result to a new file
write.csv(data, "C:\\Users\\evan9\\OneDrive\\Document\\GitHub\\1a 使用R語言進行資料分析\\助教課 Week2\\results_with_rowname.csv"
          , row.names = TRUE)
write.csv(data, "C:\\Users\\evan9\\OneDrive\\Document\\GitHub\\1a 使用R語言進行資料分析\\助教課 Week2\\results.csv"
          , row.names = FALSE)


### Practice ###










