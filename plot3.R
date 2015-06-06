## This R program is to read two days data from the file
## and make a time series plot

# Read two days data
    data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

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
    png(file="plot3.png", width=480, height=480)  

# Make plot and add more lines
    plot(mydatetime, sub1, type = "l", xlab="", ylab="Energy sub metering")
    lines(mydatetime, sub2, type="l", col="red")
    lines(mydatetime, sub3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1)

# Close the device
    dev.off()
    
