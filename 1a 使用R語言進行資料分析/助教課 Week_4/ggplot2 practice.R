library(ggplot2)
library(dplyr)


mpg

# One Variable
a = ggplot(mpg, aes(x = hwy))
b = ggplot(mpg, aes(x = fl))

a + geom_area(stat='bin')
a + geom_density(kernel='gaussian')
a + geom_dotplot()
a + geom_histogram(binwidth = 1)
#b + geom_histogram(aes(y = 'count'))
b + geom_bar()


# Two Variables
# x, y continuous
f = ggplot(mpg, aes(x=cty, y=hwy))
f + geom_jitter()
f + geom_point()
f + geom_quantile()
f + geom_jitter() + geom_quantile()
f + geom_jitter() + geom_quantile(quantiles=0.5)
f + geom_jitter() + geom_quantile(quantiles=seq(0.05, 0.95, by = 0.05))
f + geom_smooth()   # regression
f + geom_rug(sides='bl')
f + geom_text(aes(label=cty))

# discrete x, continuous y
g = ggplot(mpg, aes(x=class, y=hwy))
distinct(select(mpg, class))
g + geom_bar(stat = 'identity')     # stat = 'identity'
g + geom_boxplot()
g + geom_dotplot(binaxis = 'y', stackdir = 'center')
g + geom_violin(scale = "area")







