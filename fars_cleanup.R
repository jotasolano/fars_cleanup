#Read and observe data
accident <- read.csv("~/Documents/IDV/technology/final project/clean data/accident_data/accident.csv", header=TRUE)
vehicle <- read.csv("~/Documents/IDV/technology/final project/clean data/accident_data/vehicle.csv", header=TRUE)

accident <- data.frame(accident)
vehicle <- data.frame(vehicle)


#Keep only these columns
to.keep.a <- c("ST_CASE", "COUNTY", "CITY", "DAY", "MONTH",
             "YEAR", "DAY_WEEK", "HOUR", "MINUTE", "LATITUDE",
             "LONGITUD", "WEATHER", "FATALS", "DRUNK_DR")

to.keep.v <- c("ST_CASE", "BODY_TYP", "MOD_YEAR")

accident.short  <- accident[to.keep.a]
vehicle.short   <- vehicle[to.keep.v]
str(accident.short)

#Get rid of uknown or missing values
#Ref https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/812315
accident.short <- subset(accident.short, !(COUNTY == 000 | COUNTY == 997 | COUNTY == 998 | COUNTY == 999))
accident.short <- subset(accident.short, !(CITY == 0000 | CITY == 9997 | CITY == 9898 | CITY == 9999))
accident.short <- subset(accident.short, !(DAY == "--"))
accident.short <- subset(accident.short, !(MONTH == "--"))
accident.short <- subset(accident.short, !(YEAR == "--" | YEAR == 99))
accident.short <- subset(accident.short, !(DAY_WEEK == "--"))
accident.short <- subset(accident.short, !(HOUR == "--" | HOUR == 99))
accident.short <- subset(accident.short, !(MINUTE == "--" | MINUTE == 99))
accident.short <- subset(accident.short, !(LATITUDE == 77.7777 | LATITUDE == 88.8888 | LATITUDE == 99.9999))
accident.short <- subset(accident.short, !(LONGITUD == 77.7777 | LONGITUD == 88.8888 | LONGITUD == 99.9999))
accident.short <- subset(accident.short, !(WEATHER == 98 | WEATHER == 99))


str(accident.short)