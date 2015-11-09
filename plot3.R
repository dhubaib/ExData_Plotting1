plot3 <- function(save=TRUE){
  ## Script to create plot3
  source("plotter.R") # Read in data as "Dat"
  if(save){
    png(file = "plot3.png",width = 480, height = 480)
  }
  # Construct plot
  datetime = as.POSIXct(dat$datetime);
  
  # Initiate plot
  plot(datetime, dat$Sub_metering_1,
       type = "l",
       col = 'black',
       main = "",
       xlab = "",
       ylab = "Energy sub metering")
  
  # Add sub_metering 2
  lines(datetime, dat$Sub_metering_2,
        type = "l",
        col = 'red')
  
  # Add sub_metering 3
  lines(datetime, dat$Sub_metering_3,
        type = "l",
        col = 'blue')
  
  # Add legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lwd=1,
         col = c("black","red","blue")) 
  
  if(save){
    dev.off()
  }
}