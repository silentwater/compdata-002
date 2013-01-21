# [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                            
# [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                           
# [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                  

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
outcome[, 17] <- as.numeric(outcome[, 17])
outcome[, 23] <- as.numeric(outcome[, 23])

r1 <- range(outcome[, 11], na.rm=TRUE)
r2 <- range(outcome[, 17], na.rm=TRUE)
r3 <- range(outcome[, 23], na.rm=TRUE)
rng <- apply(rbind(r1,r2,r3), 2, max)

median1 <- median(outcome[, 11], na.rm=TRUE)
median2 <- median(outcome[, 17], na.rm=TRUE)
median3 <- median(outcome[, 23], na.rm=TRUE)

mean1 <- mean(outcome[, 11], na.rm=TRUE)
mean2 <- mean(outcome[, 17], na.rm=TRUE)
mean3 <- mean(outcome[, 23], na.rm=TRUE)

par(mfrow = c(3, 1))
title1 <- substitute("Heart Attack (" * bar(X) * "=" * m * ")", list(m=mean1))
hist(outcome[, 11], xlim=rng, xlab="30-day Death Rate", main=title1)
abline(v=median1, col="red")

title2 <- substitute("Heart Failure (" * bar(X) * "=" * m * ")", list(m=mean2))
hist(outcome[, 17], xlim=rng, xlab="30-day Death Rate", main=title2)
abline(v=median2, col="red")

title3 <- substitute("Pneumonia (" * bar(X) * "=" * m * ")", list(m=mean3))
hist(outcome[, 23], xlim=rng, xlab="30-day Death Rate", main=title3)
abline(v=median3, col="red")
