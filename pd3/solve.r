options("width"=100)

data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")

# XB23 -- miejsca w przedszkolach
# XB24 -- dzieci w wieku 3-6 lat

dane$dzieci_na_miejsce <- dane$XB24 / dane$XB23

dzieci_na_miejsce.2015<-as.vector(dane$dzieci_na_miejsce[dane$Rok==2015])
dzieci_na_miejsce.2014<-as.vector(dane$dzieci_na_miejsce[dane$Rok==2014])

summary(dzieci_na_miejsce.2015)
summary(dzieci_na_miejsce.2014)

# var.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.2014)
# var.test(dzieci_na_miejsce.2015, dzieci_na_miejsce.2014, paired=TRUE, var.equal=TRUE)
