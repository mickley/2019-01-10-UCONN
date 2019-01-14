### install.packages("ggplot2")
library(ggplot2)
head(gapminder)
library(gapminder)
## find working directory
getwd()
## to change working directory
setwd("./data/")

## basic scatter plot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

## add some color and make it a line graph
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             by = country, color = continent)) +
  geom_line() 

## answer to socrative question
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + geom_point()

## start adding some layers
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             by = country)) +
  geom_line(aes(color = continent)) +
  geom_point(aes(color = "blue"))

## back to scatter (no line)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             color = continent)) +
  geom_point()

## change scale
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             color = continent)) +
  geom_point(alpha = 0.5) +
  scale_x_log10()

## add regression line
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             color = continent)) +
  geom_point(alpha = 0.5, aes(shape = continent), show.legend = FALSE) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)

## clean up for publication
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             color = continent)) +
  geom_point(alpha = 0.5, size = 2, aes(shape = continent)) +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  scale_y_continuous(limits = c(0,100), breaks = seq(0,100, by = 10)) +
  theme_bw() +
  #ggtitle("Effects of per-capita GDP on Life Expectancy") +
  xlab("GDP per Capita ($)") +
  ylab("Life Expectancy (yrs)") +
  theme(plot.title = "Effects of per-capita GDP on Life Expectancy", hjust = 0.5)
ggsave(file = "life_expectancy.png", width = 20, height = 20, units = "cm")
ggsave(file = "life_expectancy.pdf", width = 20, height = 20, units = "cm")

##socrative
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()
ggsave(file = "life_expectancy.pdf")
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + geom_point()
ggsave(file = "life_expectancy.pdf")


## boxplot
plot <- ggplot(data = gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot()

plot
plot_tomato <- plot + geom_point(alpha = 0.5, color = "tomato")
plot_jitter <- plot + geom_jitter(alpha = 0.5, color = "tomato")
print(plot)

## To reach your A-game, make your plot interactive!
install.packages("plotly")
library(plotly)
ggplotly(plot_jitter)
## now scroll over the points on your plot and you'll see info about each one