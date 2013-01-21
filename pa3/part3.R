outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])

#n <- names(which(table(outcome$State) >= 20))
#outcome2 <- outcome[outcome$State %in% n, ]
outcome2 <- subset(outcome, table(outcome$State)[outcome$State]>=20)

death <- outcome2[, 11]
state <- outcome2$State
by_median=reorder(state, death, median, na.rm=TRUE)

par(las=2, cex=0.7)
boxplot(death ~ by_median,
    xaxt="n",
    ylab="30-day Death Rate",
    main="Heart Attack 30-day Death Rate by State")
tab <- table(by_median)
s <- names(tab)
axis(1,
    1:length(s),
    paste0(s, " (", as.numeric(tab), ")"), las=2, cex.axis=0.8)