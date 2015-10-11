a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
a$Date <- as.Date(strptime(a$Date, format = "%d/%m/%Y"))
subset <- a[a$Date=="2007-02-02" | a$Date=="2007-02-01",]
png("plot1.png")
hist(as.numeric(as.character(subset$Global_active_power)),
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()