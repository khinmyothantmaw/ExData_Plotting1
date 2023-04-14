par(mfrow = c(2,2), mar = c(5,4,1,2), bg = "white")
household <- read.table('./household_power_consumption.txt', sep = ";", header = TRUE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
required_date = household$Date == "2007-02-01" | household$Date == "2007-02-02"
household_data <- household[required_date,]

xtick <- seq(0,  length(household_data$Global_active_power), by = length(household_data$Global_active_power)/ 2)
xlabels <- c ('Thu', "Fri", 'Sat')

ytick1 <- seq(0,6, by = 2)
with(household_data, plot(Global_active_power , type="l", xaxt = "n", yaxt = "n",xlab = "", ylab = "Global Active Power"))
axis(side=1, at=xtick, labels = xlabels)
axis(side=2, at=ytick1, labels = ytick1)

ytick2 <- seq(234,246, by = 2)
with(household_data, plot(Voltage , type="l", xaxt = "n", yaxt = "n",xlab = "datetime", ylab = "Voltage"))
axis(side=1, at=xtick, labels = xlabels)
axis(side=2, at=ytick2, labels = ytick2)

ytick3 <- seq(0,30, by = 10)
with(household_data, plot(Sub_metering_1 , type="l", xaxt = "n", yaxt = "n", xlab = "", ylab="Energy sub metering"))
with(household_data, lines(Sub_metering_2 , type="l", col = "red"))
with(household_data, lines(Sub_metering_3 , type="l", col = "blue"))
axis(side=1, at=xtick, labels = xlabels)
axis(side=2 , at=ytick3, labels = ytick3)
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),title.cex = 0.7, lty = c(1,1,1), pch = c(NA, NA, NA) , col = c('black', 'red', 'blue'))

ytick4 <- seq(0.0,0.5, by = 0.1)
with(household_data, plot(Global_reactive_power , type="l", xaxt = "n", yaxt = "n",xlab = "datetime", ylab = "Global_reactive_power"))
axis(side=1, at=xtick, labels = xlabels)
axis(side=2, at=ytick4, labels = ytick4)

dev.copy(png, file="plot4.png")
dev.off()
