x <- read.csv('hw1_data.csv')

writeLines('Question 1:')
names(x)

writeLines('')
writeLines('Question 2:')
head(x, 2)

writeLines('')
writeLines('Question 3:')
nrow(x)

writeLines('')
writeLines('Question 4:')
tail(x, 2)

writeLines('')
writeLines('Question 5:')
x[47, 'Ozone']

writeLines('')
writeLines('Question 6:')
sum(is.na(x$Ozone))

writeLines('')
writeLines('Question 7:')
mean(x$Ozone[!is.na(x$Ozone)])

writeLines('')
writeLines('Question 8:')
mean(x[!is.na(x$Ozone) & (x$Ozone > 31) & !is.na(x$Temp) & (x$Temp > 90) & !is.na(x$Solar.R), 'Solar.R'])

writeLines('')
writeLines('Question 9:')
class(x$Month)

writeLines('')
writeLines('Question 10:')
mean(x[x$Month == 6, 'Temp'])
