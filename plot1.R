household <- read.table('./household_power_consumption.txt', sep = ";", header = TRUE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
required_date = household$Date == "2007-02-01" | household$Date == "2007-02-02"
household_data <- household[required_date,]
household_data$Global_active_power <- as.numeric(household_data$Global_active_power)
hist(household_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()