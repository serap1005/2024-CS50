#ask for file, and read the file
file <- readline("Enter the file you want to read: ")
file_read <- read.csv(file)

#for view
#View(file_read)

#do calculations, using paste, print
print(paste(
  nrow(file_read),
  min(file_read$time),
  max(file_read$time),
  sum(file_read$time)
))
