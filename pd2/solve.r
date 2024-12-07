data_file <- paste(getwd(), "/dane/DaneR.csv", sep="")
dane <- read.csv(data_file, header=TRUE, sep=";", dec=",", encoding="UTF-8")


# ----------------------------------------------

# podpunkt a
# proszę wybrać dane dla jednego roku (np. do nowego obiektu), a następnie proszę dla
# każdego województwa przygotować podstawowe podsumowania wybranej zmiennej
# (liczbowej) – proszę użyć odpowiedniej funkcji, tak żeby podział na województwa był
# automatyczny; w tym punkcie można napisać kilka słów komentarza;

# wybrany rok 2012

# lista_wojewodztw <- unique(dane2012$Wojewodztwo)

dane2012 <- dane[dane$Rok == 2012,]
by(dane2012$XA20, dane2012$Wojewodztwo, summary)

# TODO: kilka słów komentarze


# ----------------------------------------------
# print("")

# podpunkt b
# proszę przygotować odpowiednią tabelę pokazującą liczbę powiatów w kontekście
# nakładów inwestycyjnych w przedsiębiorstwach na jednego mieszkańca w
# poszczególnych latach (wskazówka: jedna z danych ma charakter ciągły – sposób
# poradzenia sobie z tym problemem należy odszukać w przykładach z materiałów);

# filter NAs:
# dane_no_na$XA17
# cut(dane$XA17, breaks=c(1, 2, 1000))
# cut(dane_no_na$XA17, fivenum(dane_no_na$XA17), dig.lab=6 )

# dane_no_na_1 = dane[!is.na(dane$XA17),]
# dane_no_na = dane_no_na_1[!is.na(dane_no_na_1$XA29),]

# dane_no_na$XA17_int = as.double(dane_no_na$XA17)

dane$naklad_na_mieszkanca <- dane$XA17 / dane$XA29

# cut(dane$naklad_na_mieszkanca, breaks=((0:10)*50))


table <- table(dane$Rok, cut(dane$naklad_na_mieszkanca, breaks=5))
table




# ----------------------------------------------




# podpunkt c
# proszę przygotować stworzoną w poprzednim punkcie tabelę w wartościach
# procentowych – jaki wymiar powinien być bazą 100%?


# ----------------------------------------------

# podpunkt d
# proszę sprawdzić (dodając odpowiednie podsumowanie do tabeli z p. b), czy w każdym
# roku jest taka sama liczba powiatów.



# ----------------------------------------------