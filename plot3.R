# Importing dataset

d_tab <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
head(d_tab)

# Subsetting data from 01/02/2007 to 02/02/2007
date_tab <- subset(d_tab, Date =="1/2/2007" | Date == "2/2/2007")

# Changing Date Comlumn string to an actual Date
date_tab$CombinedDate <- paste(date_tab$Date, date_tab$Time)
date_tab$CombinedDate <- strptime(date_tab$CombinedDate, format = "%d/%m/%Y %H:%M:%S")

# Opening an PNG file with given width/height 
png("plot3.png", width = 480, height = 480)

# Plotting sw
with(date_tab, {
  
  # Plotting Sub_metering_1
  plot(CombinedDate, Sub_metering_1, col = "black", type= "l", xlab = "", ylab = "Energy sub metering")
  
  # Adding line for Sub_metering_2
  lines(CombinedDate, Sub_metering_2, col = "red")
  
  # Adding line for Sub_metering_3
  lines(CombinedDate, Sub_metering_3, col = "blue")
  
  # Adding legend
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
}
)

# Closing device
dev.off()
