#croissant if buttery &not sweet
#macaroon if buttery & sweet
#baguette if light & not sweet
#muffin if light& sweet

flavor <- readline("Flavor: ")
sweet <- readline("Sweetness: ")

if (flavor=="Light" & sweet=="No"){
  bread_choice <- "baguette"
} else if (flavor=="Light" & sweet=="Yes"){
  bread_choice <-"muffin"
} else if (flavor=="Buttery" & sweet=="Yes"){
  bread_choice <-"macaroon"
} else if (flavor=="Buttery" & sweet=="No"){
  bread_choice <-"croissant"
} else {
  cat("Invalid option.")
  bread_choice <- NULL
}

if (!is.null(bread_choice)) {
  cat("You might like", bread_choice)
}