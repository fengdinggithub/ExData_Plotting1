## This R program is to read two days data from the file
## and make a time series plot

# Read two days data
    data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

# Get Global Active Power column
    gap <- data[,3]

# Get date and time
    mydate <- data[,1]
    mytime <- data[,2]

# Construct datetime format for plot
    mydatetime1 <- paste(mydate, mytime)
    mydatetime <- strptime(mydatetime1, "%d/%m/%Y %H:%M:%S")

# Open PNG graphics device
    png(file="plot2.png", width=480, height=480)  

# Make plot
    plot(mydatetime, gap, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device
    dev.off()
    
