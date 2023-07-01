c(2,4,6)
c("Alice", "Bob", "Charlie", "Dan", "Fiona", "Gab")
seq(1, 100, 2)
c(10, 20, 30, 40) + 5
c(10, 20, 30, 40) / 5
subjects <- c("Alice", "Bob", "Charlie", "Dan", "Fiona", "Gab")
weight <- c(60, 72, 57, 90, 72, 95) # in kilograms. 
height <- c(1.75, 1.80, 1.65, 1.90, 1.91, 1.74 ) # in metres.
subjects
weight / (height ^ 2)
height2 <- c(1.75, 1.80, 1.65, 1.90, 1.91)
weight / (height2 ^ 2)
bmi <- weight / (height ^ 2)
c(TRUE, FALSE, TRUE, TRUE)
# Find BMIs over 25, indicating an obese person
bmi
bmi > 25
subjects
subjects[bmi > 25]

students <- c("Alex", "Aria", "Addison", "Aurora")
exam1 <- c(50, 65, 45, 35)
exam2 <- c(85, 72, 81, 62)
exam3 <- c(62, 55, 85, 42)
average_grade <- (exam1 + exam2 + exam3) / 3
average_grade
#TIP: Above two lines can be merged into one line if placed within brackets:
(average_grade <- (exam1 + exam2 + exam3) / 3)
average_grade >= 50 # Gives a vector of logical datatype results.
students[average_grade >= 50] # Gives vector values for TRUE positions only.

bmi_data <- data.frame(subjects, weight, height)
bmi_data
bmi_data$subjects
bmi_data[c("subjects", "height")]
# First and third column
bmi_data[c(1, 3)]
# Using row/column indices with data frames
bmi_data[1, 2] # This means show value of cell in row 1, column 2.
# TIP: This is different from specifying columns above:
bmi_data[c(1, 2)] # This means show all rows for columns 1 & 2 only.
bmi_data[, c(1, 2)] # This is same as above, but clarifies we want all rows.
bmi_data[1, c(1, 2)] # This means show row 1 but for columns 1 & 2 only.
# Get second and third row, columns 1 to 3
bmi_data[c(2, 3), 1:3]
# First three rows, all columns
bmi_data[1:3, ]
# Second and third columns, all rows
bmi_data[, c(2, 3)]
bmi_data[, c("weight", "height")]
# Get second and third columns and first three rows
cols <- c(F, T, T)
rows <- c(T, T, T, F, F, F)
bmi_data[rows, cols]
# Show all columns for rows wit weight over 75kg:
bmi_data[weight>70, ]

bmi_data$bmi <- bmi_data$weight / (bmi_data$height ^ 2)
bmi_data
bmi_data[bmi_data$bmi>25, ]
(students_data <- data.frame(students, exam1, exam2, exam3))
# students_data$exam1 + students_data$exam2 + students_data$exam3) / 3
(students_data$average_grade <-
    rowSums(students_data[, c("exam1", "exam2","exam3")])/3)
students_data[students_data$average_grade >= 50,
              c("students", "average_grade")]

data()
? cars
# Retrieve first 10 rows
cars[1:10, ]
# Column names
colnames(cars)
# list first 6 rows
head(cars)
# statistical summary
summary(cars)
plot(cars)
? airquality
plot(airquality)
? mtcars
plot(mtcars)
? pressure
plot(pressure)

plot(airquality)
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Wind , type = "l")
# base graphic - ylim sets the min & max y-axis values
plot(airquality$Wind, type = "l", ylim = c(0, 100)) # add points
points(airquality$Wind, col= "blue") # add second line in red color
lines(airquality$Temp, col = "red")
# add points to second line
points(airquality$Temp, col = "red")
plot(airquality$Ozone, xlab='Ozone Concentration', ylab='# Instances', main = 'Ozone levels in NY city', col = 'green', col.main = 'red')
plot(airquality$Ozone, xlab = 'Ozone Conc', ylab = '# Instances', col = 'darkgreen', cex=0.5) # cex provides size magnification.
title(main = 'Ozone levels in NY city', col.main = 'blue')

barplot(height = mtcars$cyl, main = "Number of Cylinders")     
(carsPerCyl <- table(mtcars$cyl))     
# Pass the result to barplot()
barplot(carsPerCyl, main = "Cases by number of cylinders")
pie(carsPerCyl)
colours <- c("deeppink3", "mediumpurple3", "springgreen3")
pie(carsPerCyl, main = "Number of Cars by Cylinder Size", col = colours)
(labels <- round(carsPerCyl/sum(carsPerCyl) * 100, 1))
(labels <- paste0(labels, "%"))
pie(carsPerCyl, main = "Number of Cars by Cylinder Size", col = colours, labels = labels)
legend(x=1.0, y=0.5, legend = names(carsPerCyl), fill = colours)

hist(airquality$Solar.R)
hist(airquality$Solar.R, breaks = seq(from = 0, to = 350, by = 25))

boxplot(airquality[,1:4])

plot(pressure$temperature, pressure$pressure, type = 'l',
     main = "Pressure by Temperature",
     xlab = "Temperature", ylab = "Pressure")
plot(pressure$temperature, pressure$pressure, type = 's',
     main = "Pressure by Temperature",
     xlab = "Temperature", ylab = "Pressure")
# View(mtcars) # Uncomment this line to view contents of mtcars dataframe. # 3a. First, produce a table of number of cars by engine type:
(carsByEngine <- table(mtcars$vs))
##
##  0  1
## 18 14
# 3b. Display as Numbers:
(labels <- paste0(carsByEngine, " cars")) ## [1] "18 cars" "14 cars"
colours <- c("lightblue1", "lemonchiffon")
pie(carsByEngine, labels = labels, col = colours, main = "Number of Cars by Engine type")
legend(x=1.0, y=1.0, cex=0.7, c("V-shaped", "Straight"), fill = colours)
# 3c. Display as proportion (%), with legend bottom right:
colours <- c("lightblue1", "lemonchiffon")
labels <- paste0(round(carsByEngine/sum(carsByEngine)*100), "%")
pie(carsByEngine, labels = labels, col = colours, main = "Proportion of Cars by Engine type")
legend(x="bottomright", cex=0.7, c("V-shaped", "Straight"), fill = colours)

