#green tea if caffeine & light
#black if caf&bold
#chamomile if no caf& light
#rooibos if no caf& bold

flavor <- readline("Flavor: ")
caffeine <- readline("Caffeine: ")

if (flavor=="Light" & caffeine=="Yes"){
  tea_choice <- "green tea"
} else if (flavor=="Bold" & caffeine=="Yes"){
  tea_choice <-"black tea"
} else if (flavor=="Bold" & caffeine=="No"){
  tea_choice <- "rooibos tea"
} else if (flavor=="Light" & caffeine=="No"){
  tea_choice <- "chamomile tea"
} else {
  cat("Invalid option.")
  tea_choice <- NULL
}

if (!is.null(tea_choice)) {
  cat("You might like", tea_choice)
}