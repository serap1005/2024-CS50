#ask for country's name
#total happiness score

read_files <- function (filename) {
  read.csv(paste0(filename, ".csv"))
}

country <- (readline("Country: "))

for (year in 2020:2024) {
  file <- read_files(as.character(year))
  if (country %in% unique(file$country)) {
    country_data <- file[file$country == country, ]
    score <- apply(country_data[,-1], MARGIN=1, FUN=sum)
    print(paste0(country, "(", year, "):", round(score, 2)))
  } else{
    print(paste0(country, "(", year, "): unavailable"))
  }
}