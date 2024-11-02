random_character <- function() {
    return(sample(x = letters,size=1))
}

print_sequence <- function(length) {
  for (i in 1: length){
    random_word <- random_character()
    cat(random_word)
    Sys.sleep(0.25)
  }
}

print_sequence(20)