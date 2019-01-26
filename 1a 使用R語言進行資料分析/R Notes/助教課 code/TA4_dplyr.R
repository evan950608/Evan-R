library(dplyr)


iris
summary(iris)
glimpse(iris)

# filter()
head( filter(iris, Species == "setosa", Petal.Length > 1.4) )
head( iris[iris$Petal.Length > 1.4 & iris$Species == "setosa", ] )


# slice()
slice(iris, 1:7)
slice(iris, 7:5)
slice(iris, 3L)
slice(iris, 3)
filter(iris, row_number() == 3)
slice(iris, n())    # n() means the last one
slice(iris, -3)     # drop 3rd row
slice(iris, -5:-n())# drop 5th to last row
help(slice)
class(3)    # numeric
class(3L)   # integer

# arrange()
head( arrange(iris, Sepal.Length) )         # arrange Sepal.Length in ascending order
head( arrange(iris, desc(Sepal.Length)) )   # descending order

# select()
head( select(iris, everything()) )
head( select(iris, Sepal.Length, Sepal.Width) )
head( select(iris, starts_with("Petal")) )
head( select(iris, Species, everything()) )
head( select(iris, -Sepal.Length) )         # drops Sepal.Length column

# rename()
names(iris)
head( rename(iris, SL = Sepal.Length) )     # full df with new name
head( select(iris, SL = Sepal.Length) )     # only SL column with new name

# distinct()
select(iris, Species)
distinct(select(iris, Species))             # find unqiue values

# mutate()
head( mutate(iris, Petal = Petal.Length - Petal.Width) )
    # create a new column Petal = Petal.Length - Petal.Width
head(mutate(iris, Sepal.Length = Sepal.Length*2))

# transmute()
head( transmute(iris, Petal = Petal.Length - Petal.Width) )
    # only a new column Petal = Petal.Length - Petal.Width

# summarise()
summary(iris)
summarise(iris)
summarise(iris, avg_petal_length = mean(Petal.Length, na.rm = TRUE))
    # useful when only 1 value is concerned
mutate(iris, avg_PL = mean(Petal.Length, na.rm=TRUE))

# sample_n() / sample_frac()
sample_n(iris, 5)       # take 5 row as sample
help("sample_n")
sample_frac(iris, 0.05) # take fraction 0.05 (5%) as sample
help("sample_frac")

# Pipe Operator
iris %>%
  select(-Species) %>%
  summarise_all(funs(mean))
help("summarise_all")   # apply function to all columns

iris %>%
  select(Species, PL = Petal.Length) %>%
  summarise(avg = mean(PL), sum = sum(PL))











