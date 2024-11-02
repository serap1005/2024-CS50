library("tidyverse")

#View(storms)

storms_data <- storms |>
  select(c('name', 'year', 'tropicalstorm_force_diameter', 'status')) |>
  filter(!is.na(tropicalstorm_force_diameter)) |>
  group_by(year) |>
  slice_max(tropicalstorm_force_diameter) |>
  arrange(year) |>
  filter(year > 2000)

# Create a new column combining 'name' and 'year'

storms_data <- storms_data |>
  mutate(name_year = paste(name, year, sep = " - ")) |>
  mutate(name_year = make.unique(name_year))

# Convert the combined name and year column to a factor for proper ordering in the plot

storms_data$name_year <- factor(storms_data$name_year, levels = storms_data$name_year)


# Plotting
diameter_plot <- ggplot(storms_data, aes(x = name_year, y = tropicalstorm_force_diameter)) +
  geom_col(aes(fill = name_year), show.legend = FALSE) +
  labs(
    x = 'Storm (Name - Year)',
    y = 'Tropical Storm Force Diameter',
    title = 'Maximum Tropical Storm Force Diameter after 2000'
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.9, vjust = 0.5))

# Save the plot

ggsave(
  'visualization.png',
  plot = diameter_plot,
  width = 2000,
  height = 900,
  units ='px'
)
