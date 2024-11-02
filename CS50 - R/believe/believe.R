# Generated with ChatGPT

check_stock_ticker_conflicts <- function(tickers) {
  # Check if input is a list
  if (!is.list(tickers)) {
    stop("Input must be a list of stock tickers.")
  }

  seen_tickers <- character(0)

  for (ticker in tickers) {
    #Check if ticker is a character string
    if (!is.character(ticker) || length(ticker) != 1) {
      stop("Each stock ticker must be a single character string.")
    }

    #Check for valid ticker format (e.g., alphanumeric, max length 5)
    if (!grepl("^[A-Z0-9]{1,5}$", ticker)) {
      stop("Stock ticker must be alphanumeric with a maximum of 5 characters.")
    }

    # Check for duplicates
    if (ticker %in% seen_tickers) {
      return(paste("Conflict detected: Ticker", ticker, "is duplicated."))
    }

    # Add ticker to the seen list
    seen_tickers <- c(seen_tickers, ticker)
  }

  # If no conflicts are found
  return("No conflicts detected with the stock tickers.")
}
