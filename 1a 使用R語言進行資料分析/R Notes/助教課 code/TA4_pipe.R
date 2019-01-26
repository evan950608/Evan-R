library(magrittr)


# 1
exp(log(3))
# exp(1) >> e
# exp(2) >> e**2

3 %>% 
  log %>%
  exp
3 %>% log %>% exp

# 2
sapply(-10:10, abs)

-10:10 %>%
  sapply(abs)
-10:10 %>% lapply(abs)
# -10:10 %>% abs >> ERROR

# 3
a = c(1, 4, 6, 8, 9, 30)

for (i in 1:length(a)){
  a[i] <- a[i]**2
}
a

a = c(1, 4, 6, 8, 9, 30)

a %<>% sapply( function(x){ x**2 } )    # save result in a, change a value
a %>% sapply(function(x) {x**2})        # return a result, does not change a value
a
