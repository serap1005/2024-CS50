
describe("get_stock_data()", {

  it("retrieves stock data successfully for a valid symbol", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    expect_true(!is.null(stock_data))
  })

  it("returns a time series object", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    expect_s3_class(stock_data, "xts")
  })


})
