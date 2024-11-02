get_stock_data <- function(symbol, start_date, end_date) {
  #install.packages("quantmod")
  library(quantmod)
  stock_data <- tryCatch
    getSymbols(symbol, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)

}
