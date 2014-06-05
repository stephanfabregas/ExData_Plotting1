# Read in the data
# Only loads data from 1 Feb 2007 and 2 Feb 2007
dt <- read.table("household_power_consumption.txt",sep=";", na.strings="?",
           colClasses=c(rep("character",2), rep("numeric",7)),
           skip = 66637, nrows = 69517-66637,
           col.names=c("Date","Time","Global_active_power",
                       "Global_reactive_power","Voltage",
                       "Global_intensity","Sub_metering_1",
                       "Sub_metering_2","Sub_metering_3"))

# Reformat the date and time variables
dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")
dt$Time <- strptime(dt$Time,format="%H:%M:%S")
dt$Time <- format(dt$Time,format="%H:%M:%S") # Format object for viewing

# Generate the plot (histogram of Global Active Power)
png("plot2.png")
plot(dt$Global_active_power, type="l", xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(0,length(dt$Global_active_power)/2,
                  length(dt$Global_active_power)),
     labels=c("Thu", "Fri", "Sat"))
dev.off()
