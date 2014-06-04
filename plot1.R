# Expl Data Analysis
# Recreate Plot 1 

## Read data
elecdata<-read.table("./Data/household_power_consumption.txt", sep=";", header=TRUE)

## Change Date type and subset data for req'd dates

elecdata$newDate<-as.Date(elecdata$Date, "%d/%m/%Y")
subelecdata<-subset(elecdata, elecdata$newDate =="2007-02-01" | elecdata$newDate=="2007-02-02")

## change variable to numeric type
    subelecdata$Global_active_power<-as.numeric(as.character(subelecdata$Global_active_power))
  

#plot 1
png(filename="plot1.png", width = 480, height = 480)

  hist(subelecdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

  subelecdata$dtcomb<-strptime(paste(as.character(subelecdata$Date), as.character(subelecdata$Time))
                 ,"%d/%m/%Y %H:%M:%S") 
dev.off()
