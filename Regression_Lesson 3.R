      # INTRODUCTION TO REGRESSION ANALYSIS ####

library(dplyr)
library(ggplot2)

      
head(world)  # a snapshot of data contained in each variable or column 

 # Descriptive Statistics ---- 
summary(world['gdppcap08'])   # provides summary statistics
summary(world['spendhealth'])  # provides summary statistics

# Exploring the Bivariate Relationship ==== 
 # Correlation ---- 

world %>%
  summarise(
    correlation = cor(gdppcap08,spendhealth, use = "complete.obs")
    )

# Visualizing the Relationship ----
ggplot(world,aes(gdppcap08, spendhealth)
) + 
  geom_point() + 
labs(title = "GDP per Capita and Health Spending",
     x = "GDP per Capita",
     y = "Health Spending")


# Adding a linear trend line 
ggplot(world,aes(gdppcap08, spendhealth)
) + 
  geom_point() + 
  geom_smooth(method = 'lm', se = FALSE
  )
  labs(title = "GDP per Capita and Health Spending",
       x = "GDP per Capita",
       y = "Health Spending")
  
# Running a Linear Regression Model ==== 
lm_test <- lm(spendhealth ~ gdppcap08, world) 

  
  #LESSON 3 ####
 lm_test
  # Descriptive Statistics ---- 
  summary(world['gdppcap08'])   # provides summary statistics
  summary(world['spendhealth'])  # provides summary statistics 
  
explanatory_data <- tibble(gdppcap08 = 187:85868)  
predict(lm_test, explanatory_data) 

prediction_data <- explanatory_data %>%
  mutate(
    spendhealth = predict(
      lm_test, explanatory_data
    )
  )

prediction_data


#Displaying Predictions

ggplot(world, aes(gdppcap08, spendhealth)) + 
  geom_point() + 
  geom_smooth(method = 'lm', se = FALSE) + 
  geom_point(
    data = prediction_data, 
    color = 'blue'
  ) 
 