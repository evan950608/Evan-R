library(ggplot2)
library(dplyr)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_jitter()
# add layer using '+'
# ggsave() >> save plot as .png file

iris %>%
  ggplot(aes(x = Sepal.Length, t = Sepal.Width)) +
  geom_point


iris %>%
  filter(Species == "setosa") %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
ggplot(filter(iris, Species=='setosa'), aes(x=Sepal.Length, y=Sepal.Width)) + 
    geom_point()

# plot different species with different colors
iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point()

diamonds
diamonds %>%
    sample_frac(0.05) %>%
    ggplot(aes(carat, price)) +
    geom_point()
diamonds %>%
  sample_frac(0.05) %>%
  ggplot(aes(carat, price)) + 
  geom_point() + geom_smooth()


head(airquality)
airquality %>%
  group_by(Month) %>%
  summarise(OzoneMean = mean(Ozone, na.rm = T)) %>%
  ggplot(aes(Month, OzoneMean)) +
  geom_bar(stat = "identity")

help("group_by")
distinct(select(airquality, Month))
summarise(airquality, OzoneMean = mean(Ozone, na.rm = T))









