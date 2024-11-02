
load("air.RData")
air <- air |>
  filter(county=="OR - Clackamas") |>
  arrange(desc(emissions))

save(air,file="4.RData")
