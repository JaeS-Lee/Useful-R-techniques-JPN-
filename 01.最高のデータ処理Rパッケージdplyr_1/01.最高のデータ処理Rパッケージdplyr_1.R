library(readxl)
library(dplyr)

getwd()

df <- read_excel("./01.Example data (最高のデータ処理Rパッケージdplyr_1).xlsx")
head(df)

# Students who has > 90 in Midterm

df %>% dplyr::filter(Midterm > 90)

# Students who major Engineering

df %>% dplyr::filter(Major == 'Engineering')

# Students who does not major Engineering

df %>% dplyr::filter(Major != 'Engineering')

# Students who does not major Literature and > 85 in Midterm and > 80 in Final

df %>% dplyr::filter(Major != 'Literature' & Midterm >= 85 & Final >= 80)

# Ascending order by Name

df %>% dplyr::arrange(Name)

# Select Name column

df %>% dplyr::select(Name)

# Select Name, Midterm, and Final columns

df %>% dplyr::select(Name, Midterm, Final)

# Exclude Student Number

df %>% dplyr::select(!`Student Number`)

# Make a column with average scores

df %>% dplyr::mutate(Average = (Midterm+Final)/2)

# Make a column "Result" showing Pass (>=60) and Non-pass (<= 60)

df %>% dplyr::mutate(Average = (Midterm+Final)/2,
                     Result = ifelse(Average >= 60, 'Pass', 'Non-pass'))

# Average of Midterm using summarize function

df %>% dplyr::summarize(Average = mean(Midterm))

# Average of Midterm and Final by major

dplyr::summarize(group_by(df, Major), 
                 Midterm_average = mean(Midterm),
                 Final_average = mean(Final))

## Challenging ##

df2 <- df %>% dplyr::mutate(Average = (Midterm + Final) / 2) %>% 
  dplyr::mutate(Scholarship = 
                  ifelse(Average >= 85 & (Major == 'Engineering'  | Major == 'Natural Science'), "S", "-")) %>% 
  dplyr::filter(Scholarship == 'S') %>% 
  dplyr::select(`Student Number`, Name, Major, Average)

df2
