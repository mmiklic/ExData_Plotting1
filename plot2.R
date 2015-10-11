a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
a$Date <- as.Date(strptime(a$Date, format = "%d/%m/%Y"))
subset <- a[a$Date=="2007-02-02" | a$Date=="2007-02-01",]
png("plot2.png")
plot(strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S"),
     as.numeric(as.character(subset$Global_active_power)),
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()