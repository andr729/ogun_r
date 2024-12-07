options("width"=100)

data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")

# # # # # # # # #
#  Podpunkt a:  #
# # # # # # # # #

# wybrany rok: 2012

dane2012 <- dane[dane$Rok == 2012,]
by(dane2012$XA20, dane2012$Wojewodztwo, summary)


# # # # # # # # #
#  Podpunkt b:  #
# # # # # # # # #

# Mnożymy przez 1e6, aby przeliczyć miliony na jedności:
dane$naklad_na_mieszkanca <- (dane$XA17 * 1e6) / dane$XA29
tabela <- table(cut(dane$naklad_na_mieszkanca, breaks=10), dane$Rok)
tabela


# # # # # # # # #
#  Podpunkt c:  #
# # # # # # # # #

# Wymiar 100% -- sumaryczna liczba województw
round(prop.table(tabela,2),2) 


# # # # # # # # #
#  Podpunkt d:  #
# # # # # # # # #

liczba_lat <- ncol(tabela)
liczba_w = replicate(liczba_lat, 0)
for (i in 1:liczba_lat) {
    liczba_w[i] <- sum(tabela[,i])
}
liczba_w
