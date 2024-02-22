library(readxl)
library(dplyr)
library(ggplot2)

getwd()

df <- read_excel("./02.Example data (最高の視覚化Rパッケージggplot2_1).xlsx")
head(df)

# Select students whose major is engineering and make a barplot

df_e1 <- df %>% dplyr::mutate(Average = (Midterm + Final)/2)
df_e1

ggplot(df_e1, aes(x = Name, y = Average)) + 
  geom_bar(stat = "identity")

# Set colors

ggplot(df_e1, aes(x = Name, y = Average, fill = Major)) + 
  geom_bar(stat = "identity")

# Designate colors

ggplot(df_e1, aes(x = Name, y = Average, fill = Major)) + 
  geom_bar(stat = "identity") +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet'))

# Make a black line on each graphs

ggplot(df_e1, aes(x = Name, y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet'))

# Change angles of x axes

ggplot(df_e1, aes(x = Name, y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet')) +
  scale_x_discrete(guide = guide_axis(angle = 30))

# Remove the gap between the axes and set ranges (0 - 100)

ggplot(df_e1, aes(x = Name, y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet')) +
  scale_x_discrete(guide = guide_axis(angle = 30)) +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0))

# Arrange them from low to high average scores

ggplot(df_e1, aes(x = reorder(Name, Average), y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet')) +
  scale_x_discrete(guide = guide_axis(angle = 30)) +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0))

# Change axes names

ggplot(df_e1, aes(x = reorder(Name, Average), y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet')) +
  scale_x_discrete(guide = guide_axis(angle = 30)) +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0)) +
  xlab('Student Names') +
  ylab('Average Scores') +
  theme(axis.title.x = element_text(size = 14, face = 'bold'),
        axis.title.y = element_text(size = 14, face = 'bold'))

# Change tick settings

ggplot(df_e1, aes(x = reorder(Name, Average), y = Average, fill = Major)) + 
  geom_bar(stat = "identity", color = 'black') +
  scale_fill_discrete(breaks = c('Medicine', 'Engineering', 'Natural Science',
                                 'Social Science', 'Literature', 'Art')) +
  scale_fill_manual(values = c('red', 'orange', 'yellow',
                               'green', 'blue', 'violet')) +
  scale_x_discrete(guide = guide_axis(angle = 30)) +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0)) +
  xlab('Student Names') +
  ylab('Average Scores') +
  theme(axis.title.x = element_text(size = 14, face = 'bold'),
        axis.title.y = element_text(size = 14, face = 'bold'),
        axis.text.x = element_text(size = 8, face = 'bold'),
        axis.text.y = element_text(size = 12, face = 'bold'))