# Note: type "Sys.setlocale("LC_TIME", "English")" in console first!!

# Column name of data
col_name <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

# Read data only from 1/2/2007~2/2/2007
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?",
                   skip = 66637, nrows = 2880, col.names = col_name)

# Plot4
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- strptime(data$Date_time, "%d/%m/%Y %H:%M:%S")

# Output to png deivce
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")

# Multi-base plot
par(mfrow = c(2, 2))

# Plot
plot(data$Date_time, data$Global_active_power, type="l", 
     xlab = "",
     ylab = "Global Active Power")

plot(data$Date_time, data$Voltage, type="l", 
     xlab = "datetime",
     ylab = "Voltage")

with(data, plot(data$Date_time, data$Sub_metering_1, type="l",
                xlab = "",
                ylab = "Energy sub metering"))
     with(data, lines(data$Date_time, data$Sub_metering_2, type="l", col = "red"))
     with(data, lines(data$Date_time, data$Sub_metering_3, type="l", col = "blue"))
     legend("topright", lty = c("solid", "solid", "solid"),
            col = c("black", "blue", "red"),
            bty="n", cex = 0.75,
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Date_time, data$Global_reactive_power, type="l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()