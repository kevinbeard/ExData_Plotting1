# Expl Data Analysis
#Recreate Plot 4

## Read data
elecdata<-read.table("./Data/household_power_consumption.txt", sep=";", header=TRUE)

## Change Date type and subset data for reqd dates

elecdata$newDate<-as.Date(elecdata$Date, "%d/%m/%Y")
subelecdata<-subset(elecdata, elecdata$newDate =="2007-02-01" | elecdata$newDate=="2007-02-02")
subelecdata$dtcomb<-strptime(paste(as.character(subelecdata$Date), as.character(subelecdata$Time))
                 ,"%d/%m/%Y %H:%M:%S") 

## change variable to numeric type
subelecdata$Global_active_power<-as.numeric(as.character(subelecdata$Global_active_power))
subelecdata$Sub_metering_1<-as.numeric(as.character(subelecdata$Sub_metering_1))
subelecdata$Sub_metering_2<-as.numeric(as.character(subelecdata$Sub_metering_2))
subelecdata$Sub_metering_3<-as.numeric(as.character(subelecdata$Sub_metering_3))
subelecdata$Voltage<-as.numeric(as.character(subelecdata$Voltage))
subelecdata$Global_reactive_power<-as.numeric(as.character(subelecdata$Global_reactive_power))


## Plot 4
png(filename="plot4.png")

  par(mfrow=c(2,2))
## Panel1
  plot(subelecdata$dtcomb, subelecdata$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
## Panel 2
  plot(subelecdata$dtcomb, subelecdata$Voltage, type="l", xlab="datetime",
     ylab="Voltage")


## Panel 3
  plot(subelecdata$dtcomb, subelecdata$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering", col="black")
  lines(subelecdata$dtcomb, subelecdata$Sub_metering_2, type="l", col="red")
  lines(subelecdata$dtcomb, subelecdata$Sub_metering_3, type="l", col="blue")


  legend("topright",bty="n", cex=.9, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       , lty=c(1,1,1), col = c("black", "red", "blue"))
## Panel 4
  plot(subelecdata$dtcomb, subelecdata$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

## Reset window
  par(mfrow=c(1,1))

dev.off()
