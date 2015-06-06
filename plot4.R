## This R program is to read two days data from the file
## and make a set of 4 plots

# Read two days data
    data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

# Get Global Active Power column
    gap <- data[,3]

# Get Global Reactive Power column
    Global_reactive_power <- data[,4]

# Get Voltage column
    Voltage <- data[,5]

# Get sub metering data
    sub1 <- data[,7]
    sub2 <- data[,8]
    sub3 <- data[,9]

# Get date and time
    mydate <- data[,1]
    mytime <- data[,2]

# Construct datetime format for plot
    mydatetime1 <- paste(mydate, mytime)
    mydatetime <- strptime(mydatetime1, "%d/%m/%Y %H:%M:%S")

# Open PNG graphics device
    png(file="plot4.png", width=480, height=480)  

# Creat multiplot window and add 4 plots
    par(mfrow=c(2,2))
    
    plot(mydatetime, gap, type = "l", xlab="", ylab="Global Active Power")
    
    plot(mydatetime, Voltage, type = "l", xlab="datetime")

    plot(mydatetime, sub1, type = "l", xlab="", ylab="Energy sub metering")
    lines(mydatetime, sub2, type="l", col="red")
    lines(mydatetime, sub3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1, bty="n")

    plot(mydatetime, Global_reactive_power, type = "l", xlab="datetime")

# Close the device
    dev.off()
    
