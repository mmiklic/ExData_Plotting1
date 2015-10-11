a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
a$Date <- as.Date(strptime(a$Date, format = "%d/%m/%Y"))
subset <- a[a$Date=="2007-02-02" | a$Date=="2007-02-01",]
png("plot3.png")
plot(strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S"),
     as.numeric(as.character(subset$Sub_metering_1)), type='l',
     xlab='', ylab='Energy sub metering')
points(strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S"),
       as.numeric(as.character(subset$Sub_metering_2)), type='l', col='red')
points(strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S"),
       as.numeric(as.character(subset$Sub_metering_3)), type='l', col='blue')
legend(x='topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty=1)
dev.off()
