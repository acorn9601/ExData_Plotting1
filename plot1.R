# Importing dataset

d_tab <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
head(d_tab)

# Subsetting data from 01/02/2007 to 02/02/2007
date_tab <- subset(d_tab, Date =="1/2/2007" | Date == "2/2/2007")

# Opening an PNG file with given width/height 
png("plot1.png", width = 480, height = 480)

# Plotting histogram w/ right parameters
hist(date_tab[,"Global_active_power"], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Closing device
dev.off()