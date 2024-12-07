options("width"=100)

data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")


# Podpunkt a:
# wybrany rok 2012

dane2012 <- dane[dane$Rok == 2012,]
by(dane2012$XA20, dane2012$Wojewodztwo, summary)

# TODO: kilka słów komentarze


# Podpunkt b:
# proszę przygotować odpowiednią tabelę pokazującą liczbę powiatów w kontekście
# nakładów inwestycyjnych w przedsiębiorstwach na jednego mieszkańca w
# poszczególnych latach (wskazówka: jedna z danych ma charakter ciągły – sposób
# poradzenia sobie z tym problemem należy odszukać w przykładach z materiałów);

dane$naklad_na_mieszkanca <- (dane$XA17 * 1e6) / dane$XA29
tabela <- table(cut(dane$naklad_na_mieszkanca, breaks=10), dane$Rok)
tabela



# podpunkt c
# proszę przygotować stworzoną w poprzednim punkcie tabelę w wartościach
# procentowych – jaki wymiar powinien być bazą 100%?

# Wymiar 100% -- sumaryczna liczba województw
# lata <- rownames(table)
# lata

round(prop.table(tabela,2),2) 


# ----------------------------------------------

# podpunkt d


liczba_lat <- ncol(tabela)
liczba_w = replicate(liczba_lat, 0)
for (i in 1:liczba_lat) {
    liczba_w[i] <- sum(tabela[,i])
}
liczba_w
