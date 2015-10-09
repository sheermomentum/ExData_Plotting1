
#Step 1:  Load data
#The dataset has 2,075,259 rows and 9 columns. 
#First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
#Make sure your computer has enough memory (most modern computers should be fine).

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

#You may find it useful to convert the Date and Time variables to Date/Time classes in R 
#using the strptime() and as.Date() functions.

#Note that in this dataset missing values are coded as ?.
#Filename= household_power_consumption.txt
#Fields:
#1. Date: Date in format dd/mm/yyyy
#2. Time: time in format hh:mm:ss
#3. Global_active_power: household global minute-averaged active power (in kilowatt)
#4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#5. Voltage: minute-averaged voltage (in volt)
#6. Global_intensity: household global minute-averaged current intensity (in ampere)
#7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

library(data.table)
#cClasses<-c(as.Date(), strptime(), numeric, numeric, numeric, numeric, numeric, numeric, numeric)
data<-data.table(read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?"))
#data$Date <- as.Date(data$Date , "%d/%m/%y")
#subData<-data[data$Date=="as.Date(02/01/2007", ]
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]

hist(data$Global_active_power, freq = TRUE, col = "Red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     labels = FALSE)

dev.copy(png, "plot1.png")
dev.off()