## Script to generate example plots from assignment data
filepath = "D:/GitHub/household_power_consumption.txt" # Change this line accordingly
require(data.table)

## Data is huge. read data by line, include only matching in data frame
if(!file.exists("power_data.csv")){
  
  datareader = file(filepath, open = "r")
  delim = ';' # Data is delimited by ';'
  
  header = readLines(datareader, n=1); # Get column names
  header = unlist(strsplit(header, delim));
  
  #consumptionDat = rbind(unlist(strsplit(readLines(datareader,n=1),';')))
  #colnames(consumptionDat) <- header;
  
  minDate = as.Date("2007-02-01")
  maxDate = as.Date("2007-02-02")
  
  first=TRUE
  while(length( (l <- readLines(datareader, n = 1) )) > 0 ){
    
    
    l <- unlist(strsplit(l, delim))
    datetime = as.Date(l[1],format="%d/%m/%Y")
    
    if (datetime > maxDate){
      break;
    }
    
    if (datetime >= minDate){
      # Handle missing
      l[grepl("\\?",l)] <- "NA"
      # Coerce to numeric
      l[-(1:2)]<-as.numeric(l[-(1:2)])
      
      if(first){
        first = FALSE
        consumptionDat = rbind(l)   
      }else{
        consumptionDat <- rbind(consumptionDat,l) #list of data to import 
      }
      
      
    }
  }
  
  consumptionDat = data.table(consumptionDat) # convert to data table
  
  # Format dates & get rid of time value
  colnames(consumptionDat) <- header
  datetime = unlist(lapply(lapply(paste(consumptionDat$Date,consumptionDat$Time),strptime,format="%d/%m/%Y %H:%M:%S"),format,"%Y-%m-%d %H:%M:%S"))
  datetime = as.POSIXct(datetime)
  consumptionDat$datetime = datetime
  
  write.csv(consumptionDat,file="power_data.csv",row.names=FALSE)
  dat = consumptionDat
}else{
  dat = read.csv("power_data.csv",header=TRUE)
}