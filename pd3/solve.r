options("width"=100)

data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")

# XB03 -- Liczba dzieci na 1 miejsce w przedszkolu

# Porównanie lat 2015 i 2014:

XB03.2015<-as.vector(dane$XB03[dane$Rok==2015])
XB03.2014<-as.vector(dane$XB03[dane$Rok==2014])

summary(XB03.2015)
summary(XB03.2014)

var.test(XB03.2015, XB03.2014)
t.test(XB03.2015, XB03.2014, paired=TRUE, var.equal=TRUE)

# Porównanie lat 2015 i średniej za wszystkie poprzednie lata:


# avg:
dane_przed_2015 <- dane[dane$Rok<2015,]

XB03.avg <- as.vector(tapply(dane_przed_2015$XB03, dane_przed_2015$Powiat, mean))

summary(XB03.avg)
var.test(XB03.2015, XB03.avg)
t.test(XB03.2015, XB03.avg)



