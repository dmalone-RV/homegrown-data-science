# myName <- ## 1 line of code
myName <- "Dontae Malone"

# mtcarsColumns <- ## 1 line of code
mtcarsColumns <- names(mtcars)

# mtcarsSummary <- ## 1 line of code
mtcarsSummary <- summary(mtcars)

# dratValue <- ## 1 line of code
dratValue <- mtcars[which(mtcars$cyl == 6 & mtcars$mpg > 21), ]$drat

# topQsec <- ## 1 - 2 lines of code
attach(mtcars)
topQsec <- head(mtcars[order(-qsec), ])