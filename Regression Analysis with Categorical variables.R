 # Load packages 
library(ggplot2) 
library(dplyr) 

# see a snapshot of the dataset
head(world)

#plot GDP vs. Life Expectancy
ggplot(world, aes(lifeex_total)) + 
  geom_histogram(bins = 9) + 
  facet_wrap(vars(gdpcap3_08)) 

# Remove NA entry from gdpcap3_08 variable
world_clean <- world[!is.na(world$gdpcap3_08), ]

# Plot GDP vs Life Expectancy Again 
ggplot(world_clean, aes(lifeex_total)) + 
  geom_histogram(bins = 9) + 
  facet_wrap(vars(gdpcap3_08)) +
  labs(x = "Life Expectancy", y = "Frequency", title = "Life Expectancy by GDP Level") 

# Compute life expectancy average for each GDP level

life_average <- world_clean %>% 
  group_by(gdpcap3_08) %>%
  summarize(average_lifeex = mean(lifeex_total, na.rm = TRUE))
  
life_average

# Regress GDP levels versus life_expectancy 
lm(lifeex_total ~ gdpcap3_08, data = world_clean) 

lm(lifeex_total ~ gdpcap3_08 + 0, data = world_clean) 
