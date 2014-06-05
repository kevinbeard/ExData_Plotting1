#Expl Data Analysis
#Recreate Plot 3

## Read data
elecdata<-read.table("./Data/household_power_consumption.txt", sep=";", header=TRUE)

## Change Date type and subset data for reqd dates

elecdata$newDate<-as.Date(elecdata$Date, "%d/%m/%Y")
subelecdata<-subset(elecdata, elecdata$newDate =="2007-02-01" | elecdata$newDate=="2007-02-02")
subelecdata$dtcomb<-strptime(paste(as.character(subelecdata$Date), as.character(subelecdata$Time))
                 ,"%d/%m/%Y %H:%M:%S") 

## change variable to numeric type

subelecdata$Sub_metering_1<-as.numeric(as.character(subelecdata$Sub_metering_1))
subelecdata$Sub_metering_2<-as.numeric(as.character(subelecdata$Sub_metering_2))
subelecdata$Sub_metering_3<-as.numeric(as.character(subelecdata$Sub_metering_3))


## Plot 3
png(filename="plot3.png", width = 480, height = 480)

  plot(subelecdata$dtcomb, subelecdata$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering", col="black")
  lines(subelecdata$dtcomb, subelecdata$Sub_metering_2, type="l", col="red")
  lines(subelecdata$dtcomb, subelecdata$Sub_metering_3, type="l", col="blue")
  
  legend("topright",cex=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       , lty=c(1,1,1), col = c("black", "red", "blue"))

dev.off()
