# Importing dataset

d_tab <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
head(d_tab)

# Subsetting data from 01/02/2007 to 02/02/2007
date_tab <- subset(d_tab, Date =="1/2/2007" | Date == "2/2/2007")

# Changing Date Comlumn string to an actual Date
date_tab$CombinedDate <- paste(date_tab$Date, date_tab$Time)
date_tab$CombinedDate <- strptime(date_tab$CombinedDate, format = "%d/%m/%Y %H:%M:%S")

# Opening an PNG file with given width/height 
png("plot2.png", width = 480, height = 480)

# Plotting the scatteplot of type l
with(date_tab, plot(CombinedDate, as.numeric(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Closing device
dev.off()