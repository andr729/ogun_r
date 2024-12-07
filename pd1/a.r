data_file <- paste(getwd(), "/DaneR.csv", sep="")

baza <- read.csv(data_file, header=TRUE, sep=";", dec=".", encoding="UTF-8")

len <- 50

baza2 <- data.frame(
    first  = (len+1):(len*2),
    second = rep(20, len),
    third  = sample(1:len, len)
)
baza2$forth <- sqrt(baza2$first) * baza2$second * baza2$third**2

# summary(baza2$third)
# summary(baza2$forth)

# summary(baza$XB14)

# nlevels(factor(baza$Powiat))

# levels(factor(baza$Powiat))[1:12]


# baza_sorted <- baza[order(baza$XB14, decreasing = TRUE),]

# baza_sorted[,1]

# baza[! is.numeric(baza$XB14)]
# fillter(baza, is.numeric(XB14))
baza[is.na(baza$XB14),] 