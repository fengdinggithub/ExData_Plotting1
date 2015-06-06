## This R program is to read two days data from the file
## and make a histographm plot

# Read two days data
    data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

# Get Global Active Power column
    gap <- data[,3]

# Open PNG graphics device
    png(file="plot1.png", width=480, height=480)  

# Make histogram graph
    hist(gap, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Close the device
    dev.off()
    
