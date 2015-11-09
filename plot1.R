## Script to create plot1
source("plotter.R") # Read in data as "Dat"

# export plot
png(file = "plot1.png",width = 480, height = 480)
hist(dat$Global_active_power,col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
