describe("plot_stock_performance()", {

  it("generates a valid ggplot object", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    p <- plot_stock_performance(stock_data, "AAPL")
    expect_s3_class(p, "ggplot")
  })

  it("plots stock performance with correct x and y labels", {
    stock_data <- get_stock_data("AAPL", "2020-01-01", "2022-12-31")
    p <- plot_stock_performance(stock_data, "AAPL")
    labels <- ggplot2::ggplot_build(p)$layout$labels
    expect_equal(labels$x, "Date")
    expect_equal(labels$y, "Closing Price")
  })

})
