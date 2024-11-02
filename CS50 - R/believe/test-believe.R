library(testthat)
source("believe.R")

test_that("check_stock_ticker_conflicts detects duplicated tickers", {
  #Duplicate tickers
  tickers1 <- list("AAPL", "GOOG", "AAPL")
  expect_equal(check_stock_ticker_conflicts(tickers1), "Conflict detected: Ticker AAPL is duplicated.")

  #Another duplicate ticker
  tickers2 <- list("TSLA", "AMZN", "TSLA", "NFLX")
  expect_equal(check_stock_ticker_conflicts(tickers2), "Conflict detected: Ticker TSLA is duplicated.")
})

test_that("check_stock_ticker_conflicts detects no conflicts with unique tickers", {
  #All tickers are unique
  tickers1 <- list("AAPL", "GOOG", "TSLA", "NFLX")
  expect_equal(check_stock_ticker_conflicts(tickers1), "No conflicts detected with the stock tickers.")
})

test_that("check_stock_ticker_conflicts handles invalid input format", {
  #Ticker exceeds length limit
  tickers1 <- list("AAPL", "INVALIDTICKER", "TSLA")
  expect_error(check_stock_ticker_conflicts(tickers1), "Stock ticker must be alphanumeric with a maximum of 5 characters.")

  #Non-alphanumeric ticker
  tickers2 <- list("AAPL", "GOOG!", "TSLA")
  expect_error(check_stock_ticker_conflicts(tickers2), "Stock ticker must be alphanumeric with a maximum of 5 characters.")
})

test_that("check_stock_ticker_conflicts warns errors", {
  #Not a list input
  expect_error(check_stock_ticker_conflicts('AAPL'))

  #Non-character ticker in list
  tickers2 <- list("AAPL", 123, "GOOG")
  expect_error(check_stock_ticker_conflicts(tickers2), "Each stock ticker must be a single character string.")
})
