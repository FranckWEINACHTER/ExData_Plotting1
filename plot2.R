#### plot 2 #####

#### import and decompress data #####
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./exdata_data_household_power_consumption.zip")

unzip(zipfile = "dev_sem1/exdata_data_household_power_consumption.zip", exdir = "./foo")

table_ener<-read.csv("./foo/household_power_consumption.txt",sep=";")
library(lubridate)
library(dplyr)

# data preparation
table_ener<-read.csv("./foo/household_power_consumption.txt",sep=";")
table_ener$Date<-dmy(table_ener$Date)
table_ener_red<-subset(table_ener,Date=="2007-02-01"|Date=="2007-02-02")
table_ener_red_varT<-mutate(table_ener_red,dat_time=paste0(Date,Time))
table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$dat_time<-ymd_hms(table_ener_red_varT$dat_time)
table_ener_red_varT$Global_active_power<-as.numeric(as.character(table_ener_red_varT$Global_active_power))

# plot tracing
plot(table_ener_red_varT$dat_time,table_ener_red_varT$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type = "l")

# plot export
dev.print(device = png, file = "plot2.png", width = 480,height=480)