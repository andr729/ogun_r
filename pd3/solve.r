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

# Do raportu: p-value wyszło wysokie, więc nie odrzucamy tego, że wariancja jest różna

t.test(XB03.2015, XB03.2014, paired=TRUE, var.equal=TRUE)

# Do raportu: p-value wyszło małe, więc średnie są te same

# Porównanie lat 2015 i średniej za wszystkie poprzednie lata:
dane_przed_2015 <- dane[dane$Rok<2015,]

XB03.avg <- as.vector(aggregate(dane_przed_2015$XB03, by=list(dane_przed_2015$Kod_powiat), FUN=mean, na.rm=TRUE)$x)

summary(XB03.avg)
var.test(XB03.2015, XB03.avg)
# Do raportu: p-value wyszło małe, wariancja może być różna, więc nie przekazujemy var.equal=TRUE


t.test(XB03.2015, XB03.avg, paired=TRUE, var.equal=FALSE)
# Do raportu: p-value wyszło małe, więc średnie są różne, odrzucamy H0, średnie się różnią
