#Load tidyverse
library(tidyverse)

#Data from tidytuesday
park_visits <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-17/national_parks.csv")

#conditonal subsetting to get data just for Oregon
or <- park_visits[park_visits$state == "OR", ]
#Dividing population by 1000 to get a more reasonable y-axis
pop <- or$visitors/1000

#ggplot for or data
ggplot(data = or)+
  geom_point(mapping = aes(x = year , y = pop, color = parkname))+
  #This sets the axis labels 
  labs(x = "Year", y = "Number of Visitors (thousands)", color = "Park Name")+
  #This puts a title on the graph
  ggtitle("Annual Visitors at Oregon State Parks")+
  #This sets the theme for the graph
  theme_bw()+
  #This rotates the text on the x-axis 90 degrees
  theme(axis.text.x = element_text(angle =90))
  

ggsave("annual_visitors_at_oregon_state_parks.pdf", width = 20, height = 8, units = "in")


  

