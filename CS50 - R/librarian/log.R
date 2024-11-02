books <-read.csv("books.csv")
authors <-read.csv("authors.csv")

#View(books)
#View(authors)

#the writer
#Mia Morgan's exclusive book
#save to answers.txt file
the_writer <- which(books$author=="Mia Morgan")
cat(books$title[the_writer])

#the musician
#1613,classic,
musician_year <- which(books$topic == "Music" & books$year=='1613')
cat(books$title[musician_year])

#the traveler
#Lysandra Silverleaf or Elena Petrova
#1775
possible_traveler <- books$author=="Lysandra Silverleaf" | books$author == "Elena Petrova"
traveler_book <- which(possible_traveler & books$year==1775)
cat(books$title[traveler_book])


#the painter
#topic art, 200-300 pages,1990 or 1992, not 1991
topic <- books$topic == "Art"
size <- 200 <= books$pages & books$pages <= 300
year <- books$year == 1990 | books$year == 1992
painter_book <- which(topic & size & year)
cat(books$title[painter_book])

#the scientist
scientist_book <- which(grepl("Quantum Mechanics", books$title))
cat(books$title[scientist_book])

#teacher
author_name <- c(authors$author[which(authors$hometown == "Zenthia")])
author <- c(books$author) %in% author_name
year <- 1700 <= books$year & books$year < 1800
topic <- books$topic == "Education"
teacher_book <- which(year & topic & author)
cat(books$title[teacher_book])
