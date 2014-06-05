#Expl Data Analysis
# Recreate Plot 2

## Read data
elecdata<-read.table("./Data/household_power_consumption.txt", sep=";", header=TRUE)

## Change Date type and subset data for reqd dates

elecdata$newDate<-as.Date(elecdata$Date, "%d/%m/%Y")
subelecdata<-subset(elecdata, elecdata$newDate =="2007-02-01" | elecdata$newDate=="2007-02-02")
subelecdata$dtcomb<-strptime(paste(as.character(subelecdata$Date), as.character(subelecdata$Time))
                             ,"%d/%m/%Y %H:%M:%S") 

## change variable to numeric type
subelecdata$Global_active_power<-as.numeric(as.character(subelecdata$Global_active_power))


## Plot 2
png(filename="plot2.png", width = 480, height = 480)

  plot(subelecdata$dtcomb, subelecdata$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
