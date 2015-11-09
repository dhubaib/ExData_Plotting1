## Script to create 
source("plotter.R") # Read in data as "Dat"

# export plot
png(file = "plot1.png",width = 480, height = 480)
hist(dat$Global_active_power,col="red")
dev.off()
