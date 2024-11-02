
load("air.RData")
air <- air |>
  filter(county=="OR - Clackamas")

save(air,file="3.RData")
