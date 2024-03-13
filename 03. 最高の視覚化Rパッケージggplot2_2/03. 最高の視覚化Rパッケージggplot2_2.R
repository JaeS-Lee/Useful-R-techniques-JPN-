library(tidyverse)
library(nparcomp)
library(readxl)

getwd()

## Load dataset ##

obesity_data <- readxl::read_excel("./03.Example data (最高の視覚化Rパッケージggplot2_2).xlsx")
View(obesity_data)
obesity_data


## Rename columns ##

obesity_data_renamed <- obesity_data %>% dplyr::rename(Student = `Student Number`,
                                                       Obesity = `Obesity index`)

obesity_data_renamed


## Preprocessing for graph ##

obesity_data_renamed$Obesity <- factor(obesity_data_renamed$Obesity, levels=c("Normal", "Obesity"))
obesity_data_renamed


## Set box plot ##

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout)) + 
  geom_boxplot()


# Set colors

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red'))


# Change axes names and tick settings

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold'))


# Arrange the maximum value of the y axis

max(obesity_data_renamed$Workout) # 180

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold')) +
  scale_y_continuous(limits = c(0,200))


# Remove legend from the graph

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold')) +
  scale_y_continuous(limits = c(0,200)) +
  theme(legend.position = "none")


# Show all the data with points

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold')) +
  scale_y_continuous(limits = c(0,200)) +
  theme(legend.position = "none") +
  geom_point(color = "black")


# Remove the background and grid from the graph

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  # Modified setting #
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold'),
        legend.position = "none", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black")) +
  ###################
  scale_y_continuous(limits = c(0,200)) +
  geom_point(color = "black")


# Add whiskers width 

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  # Modified setting #
  stat_boxplot(geom= 'errorbar' , width = 0.3, position = position_dodge(width = 0.75)) +
  ###################
  geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +

  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold'),
        legend.position = "none", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black")) +

scale_y_continuous(limits = c(0,200)) +
  geom_point(color = "black")


# Reset size and color of points

ggplot(obesity_data_renamed, aes(x = Obesity, y = Workout, fill = Obesity)) + 
  stat_boxplot(geom= 'errorbar' , width = 0.3, position = position_dodge(width = 0.75)) +
geom_boxplot(color = 'black', outlier.shape = NA) +
  scale_fill_manual(values = c('forestgreen', 'red')) +
  xlab('Obesity Index') +
  ylab('Workout time (minutes)') +
  
  theme(axis.title.x = element_text(size = 12, face = 'bold'),
        axis.title.y = element_text(size = 12, face = 'bold'),
        axis.text.x = element_text(size = 12, face = 'bold'),
        axis.text.y = element_text(size = 10, face = 'bold'),
        legend.position = "none", 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black")) +
  
  scale_y_continuous(limits = c(0,200)) +
  # Modified setting #
  geom_point(color = "navy", size = 3)
  ###################