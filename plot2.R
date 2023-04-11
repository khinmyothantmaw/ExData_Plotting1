household <- read.table('./household_power_consumption.txt', sep = ";", header = TRUE)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
required_date = household$Date == "2007-02-01" | household$Date == "2007-02-02"
household_data <- household[required_date,]
household_data$Global_active_power <- as.numeric(household_data$Global_active_power)
xtick <- seq(0,  length(household_data$Global_active_power), by = length(household_data$Global_active_power)/ 2)
xlabels <- c ('Thu', "Fri", 'Sat')
ytick <- seq(0,6, by = 2)
with(household_data, plot(Global_active_power , type="l", xaxt = "n", yaxt = "n",xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(side=1, at=xtick, labels = xlabels)
axis(side=2, at=ytick, labels = ytick)
dev.copy(png, file="plot2.png")
dev.off()