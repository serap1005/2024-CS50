stock_summary <- function(stock_data) {
  returns <- diff(log(Cl(stock_data)))
  summary_stats <- data.frame(
    Mean_Return = mean(returns),
    Volatility = sd(returns),
    Max_Return = max(returns),
    Min_Return = min(returns)
  )

  # Add a fun reflection based on mean return
  if (summary_stats$Mean_Return > 0) {
    message("Great news! This stock seems to be heading in the right direction with positive average returns!")
  } else {
    message("Hmmm, looks like this stock had a rough time with negative returns. Maybe time to dig deeper!")
  }

  return(summary_stats)
}
