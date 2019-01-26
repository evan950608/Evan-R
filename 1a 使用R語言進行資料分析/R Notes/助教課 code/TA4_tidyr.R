library(tidyr)
library(magrittr)


# gather()
student <- c('Bob', 'Alice', 'Eve')
math <- c(70, 40 , 20)
english <- c(80, 60 , 30 )
chinese <- c(100, 80, 60)

scores <- data.frame(Student = student, Math = math, English = english, Chinese = chinese)
View(scores)

gather(scores, Subject, Score, Math:Chinese)

scores %>% 
  gather(Subject, Score, Math:Chinese) %>%
  View

# spread()
scoresg <- scores %>% gather(Subject, Score, Math:Chinese)
View(scoresg)

scoresg %>%
  spread(Subject, Score) %>%
  View

scores <- data.frame(
  time = as.Date('2010-09-14') + 0:9,
  CM = rnorm(10, 90, 1),
  JI = rnorm(10, 60, 2),
  EE = rnorm(10, 40, 4)
)
scores
View(scores)
scoresg <- scores %>%
  gather(name, score, -time)

View(scoresg)
scoresg %>%
  spread(time, score) %>%
  View

scoresgg <- scores %>%
  gather(half_name, score, JI:EE)
View(scoresgg)

scoresgg %>%
  spread(time, score) %>%
  View


# separate()
df = data.frame(x = c("af_jisdfg", "aji.a", "bji#y", "cji__z"))
df

df %>%
  separate(x, c("ABC", "XYZ"))

## Example
email = data.frame(
  name = c("Bob", "Alice", "Eve"),
  email = c('a123@gmail.com', 'hhh@yahoo.com.tw', 'asdf@rrrr.com')
)
email %>%
  separate(email, c("Username", "Domain"), sep = "@")

# unite()
df_separate <- separate(df, x, c("ABC", "XYZ"), sep = "ji")
df_separate

df_separate %>%
  unite(abcxyz, c("ABC", "XYZ"), sep = " and ")

email %>%
  separate(email, c("Username", "Domain"), sep = "@") %>%
  unite(Email, Username, Domain, sep = "#")
