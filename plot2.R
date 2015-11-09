## Script to create plot2
plot2<-function(save=TRUE){
  source("plotter.R") # Read in data as "Dat"
  if(save){
    # export plot
    png(file = "plot2.png",width = 480, height = 480)
  }
  # View plot
  plot(as.POSIXct(dat$datetime), dat$Global_active_power,
       type = "l",
       main = "",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  if(save){
    dev.off()
  }
}