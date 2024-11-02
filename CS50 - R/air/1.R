# install.packages("tidyverse")
# library("tidyverse")

#air tibble including only following columns:

air <- tibble(read.csv("air.csv"))

air <- dplyr::select(
  air,
  c(State, State.County, POLLUTANT, Emissions..Tons., starts_with('SCC.LEVEL'))
)

#rename column names

air <- air %>% dplyr::rename(
  state=State,
  county=State.County,
  pollutant=POLLUTANT,
  emissions=Emissions..Tons.,
  level_1=SCC.LEVEL.1,
  level_2=SCC.LEVEL.2,
  level_3=SCC.LEVEL.3,
  level_4=SCC.LEVEL.4,
)
air$emissions <- gsub(",", "", air$emissions)

air <- air %>%
  mutate(emissions = as.numeric(emissions))
#save file to air.RData

save(air, file="air.RData")
