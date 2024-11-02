
calculate_growth_rate <- function(years, visitors) {
  growth_rate <- (visitors[13]-visitors[1])/(years[13]-years[1])
}

predict_visitors <- function(years, visitors, year) {
  growth<-calculate_growth_rate(years, visitors)
  num_years <- (year-years[13])
  for (i in 1: num_years) {
    estimate_visitors <- visitors[13] + (growth*num_years)
  }
  return(estimate_visitors)
}

visitors <- read.csv("visitors.csv")
#View(visitors)
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
