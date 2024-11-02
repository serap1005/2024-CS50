describe("stock_summary()", {

  it("calculates summary statistics for valid stock data", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    summary_stats <- stock_summary(stock_data)
    expect_true(is.data.frame(summary_stats))
  })

  it("returns a data frame with correct columns", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    summary_stats <- stock_summary(stock_data)
    expect_equal(colnames(summary_stats), c("Mean_Return", "Volatility", "Max_Return", "Min_Return"))
  })

  it("returns numeric values for the statistics", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    summary_stats <- stock_summary(stock_data)
    expect_true(is.numeric(summary_stats$Mean_Return))
    expect_true(is.numeric(summary_stats$Volatility))
  })

})
