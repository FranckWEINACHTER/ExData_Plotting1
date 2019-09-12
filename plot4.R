#### plot 4 (multiple) #####
#### import and decompress data #####
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./exdata_data_household_power_consumption.zip")

unzip(zipfile = "dev_sem1/exdata_data_household_power_consumption.zip", exdir = "./foo")

table_ener<-read.csv("./foo/household_power_consumption.txt",sep=";")
library(lubridate)
library(dplyr)
# data preparation

table_ener$Date<-dmy(table_ener$Date)
table_ener_red<-subset(table_ener,Date=="2007-02-01"|Date=="2007-02-02")
table_ener_red_varT<-mutate(table_ener_red,dat_time=paste0(Date,Time))
table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)

#division of the screen into 4 parts
par(mfrow=c(2,2))

#1 reduced

table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red$Global_active_power<-as.numeric(as.character(table_ener_red$Global_active_power))
table_ener_red_varT$Global_active_power<-as.numeric(as.character(table_ener_red_varT$Global_active_power))
plot(table_ener_red_varT$dat_time,table_ener_red_varT$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type = "l")

#2 reduced

table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$Voltage<-as.numeric(as.character(table_ener_red_varT$Voltage))
plot(table_ener_red_varT$dat_time,table_ener_red_varT$Voltage,xlab="",ylab = "Voltage",type = "l")

#3 reduced

table_ener_red_varT$Sub_metering_1<-(as.numeric(as.character(table_ener_red_varT$Sub_metering_1)))
table_ener_red_varT$Sub_metering_2<-(as.numeric(as.character(table_ener_red_varT$Sub_metering_2)))
table_ener_red_varT$Sub_metering_3<-(as.numeric(as.character(table_ener_red_varT$Sub_metering_3)))

plot(table_ener_red_varT$dat_time,table_ener_red_varT$Sub_metering_1,xlab="",ylab = "Global Active Power (kilowatts)",type = "n")
points(table_ener_red_varT$dat_time,table_ener_red_varT$Sub_metering_1,type="l")
points(table_ener_red_varT$dat_time,table_ener_red_varT$Sub_metering_2,type="l",col="red")
points(table_ener_red_varT$dat_time,table_ener_red_varT$Sub_metering_3,type="l",col="blue")


#4 reduced

table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$Global_reactive_powe<-as.numeric(as.character(table_ener_red_varT$Global_reactive_power))
plot(table_ener_red_varT$dat_time,table_ener_red_varT$Global_reactive_power,xlab="",ylab = "Global_reactive_power",type = "l")

# plot export
dev.print(device = png, file = "plot4.png", width = 480,height=480)
