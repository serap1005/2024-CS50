

library("readr")
library("stringr")
library("tidyverse")

taylor <- read_file("lyrics/swift.txt")

#check
#is.vector(lyrics)

#clean up lyrics
lyrics <- taylor |>
  tolower() |>
  str_remove_all("'re") |>
  str_remove_all("'m") |>
  str_remove_all("n't") |>
  str_remove_all("n't") |>
  str_remove_all("'ll") |>
  str_remove_all("'s") |>
  str_replace_all("'em","them") |>
  str_replace_all("\n", " ") |>
  str_replace_all("comin'", "coming") |>
  str_replace_all("grinnin'", "grinning")

lyrics <- gsub("[[:punct:]]", "", lyrics)

#convert vector of words into data frame
#count number of each word frequency
words <- unlist(str_split(lyrics, " "))
words <- words[words !="" ]

words_data <- data.frame(
  term = unique(words),
  frequency = as.integer(table(words))
)
#find words used more than once
words_data <- words_data |>
  filter(frequency > 1) |>
  arrange(desc(frequency))

words_data$term <- factor(words_data$term, levels=words_data$term)

#plot
plot <- ggplot(words_data, aes(x = term, y = frequency)) +
  geom_col(aes(fill=term), show.legend=FALSE)+
  labs(
    x = "Word",
    y = "Frequency",
    title = "Word Usage Frequency by Taylor Swift"
  )+
  theme(axis.text.x = element_text (angle=90, hjust=0.9, vjust=0.4))

ggsave("lyrics.png", plot = plot, width=2500, height=900, units="px")





