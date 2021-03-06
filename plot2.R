# Plotting Assignment 1 for Exploratory Data Analysis

# Set workdirectory to my Git repository:
setwd("~/GitHub/ExData_Plotting1/")

# Check if the processed data file exists in the current directory:
if(file.exists("processedData.RData")){
    
    # Load processed data:
    load("processedData.RData")
    
}else{
    
    # Unzip the compressed data file:
    unzip("household_power_consumption.zip")
    
    # Load the required observations from the original data:
    data <- read.table("~/GitHub/ExData_Plotting1/household_power_consumption.txt", head = FALSE, sep = ";", skip=66637, nrows=2880)
    cnames <- readLines("~/GitHub/ExData_Plotting1/household_power_consumption.txt", 1)
    cnames <- strsplit(cnames, ";", fixed = TRUE)
    names(data) <- make.names(cnames[[1]])
    
    # Setup Date/Time format:
    time <- paste(data$Date, data$Time)
    Time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")
    data <- data[,3:9]
    data <- cbind(Time, data)
    
    # Save the processed data:
    save(data, file="processedData.RData")
}

# Initialaze the plot file parameters
png(file="plot2.png",width=480,height=480)

par(bg = NA)
plot(data$Global_active_power ~ data$Time, type="l", xlab = "",ylab = "Global Active Power (kilowatts)")

# Terminate graphics device:
dev.off()