# Column name of data
col_name <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

# Read data only from 1/2/2007~2/2/2007
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?",
                   skip = 66637, nrows = 2880, col.names = col_name)

# Output to png deivce
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

# Histogram of plot1
with(data, hist(data$Global_active_power, col = "red", main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"))

dev.off()