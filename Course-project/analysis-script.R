food_data = read.table("food_data.csv", header=TRUE, sep=";")
head(food, n=15)

fd <- food_data[,c(4, 8,10)]
fd$totalFat <- fd$totalFat * 9
fd$carbs <- fd$carbs * 4
fd$protein <- fd$protein * 4
percentage <- round(fd/rowSums(fd), 2) # Процентното разпределение

str(food_data)

summary(food_data)

t_restaurants <- table(food_data$restaurant)
barplot(prop.table(t_restaurants)*100, 2, ylim=c(0,12)) 

hist(food_data$calories)

library(ggplot2)
ggplot(food_data,aes(x=food_data$calories, fill=food_data$restaurant)) + geom_histogram(bins=20)

ggplot(food_data,aes(x=food_data$transFat, fill=food_data$restaurant)) + geom_histogram(bins=20)

ggplot(food_data, aes(x=percentage$protein, y = food_data$calories, fill = food_data$restaurant)) + geom_boxplot()

ggplot(food_data,aes(food_data$calories, food_data$totalFat, colour = food_data$restaurant)) + geom_point()	

cor(food_data[,2:10])