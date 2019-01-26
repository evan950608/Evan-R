###Pipe Operator
library(magrittr)
sapply(-10:10, abs)
-10:10 %>% abs

a = c(1,2,3,4,5)
for (i in 1:length(a)) {
    a[i] = a[i]**2
}
a

###Deploy R dplyr
library(dplyr)
iris
View(iris)

#filter
filter(iris, Species == 'setosa', Petal.Length > 1.4)
#silce
slice(iris, 1:7)
slice(iris, 10:20)
slice(iris, 3L)
slice(3)
#arrange
arrange(iris, Sepal.Length)
arrange(iris, desc(Sepal.Length))
#select
select(iris, everything())
select(iris, starts_with('Petal'))
select(iris, Sepal.Length, Sepal.Width)
select(iris, Species, everything())
select(iris, -Sepal.Length)
#rename
names(iris)
rename(iris, SL=Sepal.Length)
#distinct
select(iris, Species)
distinct(select(iris, Species))
#mutate
mutate(iris, Petal=Petal.Length - Petal.Width)  #creates a new column Petal
mutate(iris, avg_petal_length=mean(Petal.Length, na.rm = TRUE))
#transmute
transmute(iris, Petal=Petal.Length - Petal.Width)   #creates a new column Petal and delete all other columns
#summarise
summarise(iris)
summarise(iris, avg_petal_length=mean(Petal.Length, na.rm = TRUE))
#sample_n & sample_frac
sample_n(iris, 5)
sample_frac(iris, 0.05)


#Tidy R tidyr
library(tidyr)
#gather

#ggplot2
library(ggplot2)
install.packages('ggplot2')
head(iris)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))







