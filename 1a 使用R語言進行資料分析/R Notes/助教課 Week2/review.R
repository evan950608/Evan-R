# ---------------------------------
#
#   2018-10-9 TA Class
#
#   Topics:
#       1. File input / output
#       2. Control flow
#       3. Logical operators
#       4. data.frame review
#  
# ---------------------------------


#
#  1. File input/output
#


# 1.1 read file
data <- read.csv("C:\\Users\\evan9\\OneDrive\\Document\\GitHub\\1a 使用R語言進行資料分析\\助教課 Week2\\grade.csv"
    , stringsAsFactors = FALSE)
head(data)
str(data)


# 1.2 write file
write.csv(data, file = 'test.csv', row.names = FALSE)


#
#  2. Control flow
#


# 2.1 if / else if / else
if (nrow(data) < 20){
    
    print('Easy')
    
} else if (nrow(data) < 100){
    
    print('Hard')
    
} else {
    
    print('What the hell ???')
    
}


# 2.2 for-loop
for(i in 1:nrow(data)){
    print(sprintf('%s\'s hw1 grade is: %d', data[i, 'name'], data[i,'hw1']))
    #cat(data[i, 'name']'\'s', 'hw1 grade is:', data[i,'hw1'], '\n')
}

# 2.3 while-loop
a = 1
b = 1
cnt = 2
while(b < 100){
    tmp = a + b
    a = b
    b = tmp
    cnt = cnt + 1
}
cat('cnt: ', cnt, '\nb: ', b)

f_nums = c(1, 1)
for (i in 3:10) {
    f_nums = append(f_nums, f_nums[i-2] + f_nums[i-1])
}
as.integer(f_nums)

#
#  3. Logical operators
#


# 3.1  >=, <=, !=, ==
# Practice by yourself.


#
#  4. data.frame
#


# 4.1 Browse through your dataset
head(data)
str(data)


# 4.2 Basic selection
data[7:10, c('name', 'hw2', 'final')]
data[,2:4]


# 4.3 Selecting with subset function
pass_final <- subset(data, subset = final > 60)
pass_final


# 4.4 Sorting with order function
pass_final <- pass_final[order(pass_final$final),]
pass_final


