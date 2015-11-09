## Script to create plot4
plot4 <- function(save=TRUE){
  source("plotter.R") # Read in data as "Dat"
  source("plot2.R") # Load first plot
  source("plot3.R") # Load second plot
  
  if(save){
    png(file = "plot4.png",width = 480, height = 480)
    
  }
  
  # Create matrix for 4X4 plot grid
  par(mfcol = c(2,2)) # Fill in by column
  
  
  # Define datetime vector
  datetime = as.POSIXct(dat$datetime);
  
  # Plot first two plots
  plot2(FALSE)
  plot3(FALSE)
  
  ## Construct 3rd subplot
  plot(datetime, dat$Voltage,
       type = "l",
       main = "",
       xlab = "datetime",
       ylab = "Voltage")
  
  #dev.off()
  plot(datetime, dat$Global_reactive_power,
       type = "l",
       main = "",
       xlab = "datetime",
       ylab = "Global_reactive_power")
  if(save){
    dev.off()
  }
  
}