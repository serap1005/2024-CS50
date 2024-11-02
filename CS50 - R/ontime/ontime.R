bus <- read.csv('bus.csv')
rail <- read.csv('rail.csv')

# View(bus)
# View(rail)


bus$reliability <-bus$numerator / bus$denominator
rail$reliability <- rail$numerator /rail$denominator

data <-rbind(bus, rail)
route <- readline('Route: ')

if (route %in% unique(data$route)) {
  peak_index <- which(data$route == route & data$peak == 'PEAK')
  offpeak_index <- which(data$route == route & data$peak == 'OFF_PEAK')

  peak_mean <- round(mean(data$reliability[peak_index])* 100, 0)
  offpeak_mean <- round(mean(data$reliability[offpeak_index])* 100, 0)

  print(paste0('On time ', peak_mean, '% of the time during peak hours'))
  print(paste0('On time ', offpeak_mean, '% of the time during off-peak hours'))
} else {
  print('Please enter valid route')
}