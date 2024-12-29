options("width"=100)

data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")

# XB23 -- miejsca w przedszkolach
# XB24 -- dzieci w wieku 3-6 lat

dane$dzieci_na_miejsce <- dane$XB24 / dane$XB23

# Porównanie lat 2015 i 2014:

dzieci_na_miejsce.2015<-as.vector(dane$dzieci_na_miejsce[dane$Rok==2015])
dzieci_na_miejsce.2014<-as.vector(dane$dzieci_na_miejsce[dane$Rok==2014])

summary(dzieci_na_miejsce.2015)
summary(dzieci_na_miejsce.2014)

var.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.2014)
t.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.2014, paired=TRUE, var.equal=TRUE)

# Porównanie lat 2015 i średniej za wszystkie poprzednie lata:

dane_przed_2015 <- dane[dane$Rok<2015,]
dzieci_na_miejsce.avg <- as.vector(tapply(dane_przed_2015$dzieci_na_miejsce, dane_przed_2015$Powiat, mean))

summary(dzieci_na_miejsce.avg)
var.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.avg)

# paired nie działa, bo są różnej długości... (pytanie czemu?)
t.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.avg, var.equal=TRUE)



