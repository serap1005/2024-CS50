plot_stock_performance <- function(stock_data, symbol) {
  library(ggplot2)

  # Ensure the stock_data is in a format ggplot can work with
  stock_prices <- data.frame(Date = index(stock_data), Price = as.numeric(Cl(stock_data)))

  if (nrow(stock_prices) == 0) {
    stop("No data available for plotting.")
  }

  p <- ggplot(stock_prices, aes(x = Date, y = Price)) +
    geom_line(color = "blue") +
    ggtitle(paste("Stock Price Performance of", symbol)) +
    xlab("Date") +
    ylab("Closing Price")
}
