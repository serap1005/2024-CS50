library(stringr)
library(testthat)

test_that("`str_length` checks length", {
  expect_equal(str_length("apple"), 5)
  expect_equal(str_length("thousand"), 8)
  expect_equal(str_length("Hehe"), 4)
})


test_that("`str_length` checking vector length", {
  expect_equal(str_length(c("thank", "you")), c(5, 3))
  expect_equal(str_length(c("cs50", "R", "introduction")), c(4, 4, 12))
})

test_that("`str_length` handling NA", {
  expect_equal(suppressWarnings(str_length(c("thank", "you", NA))), c(5, 3, NA))
  expect_equal(suppressWarnings(str_length(NA)), NA_integer_)
})

test_that("`str_length` including emoji and punctuation", {
  expect_equal(str_length("WhAT!?"), 6)
  expect_equal(str_length("ILY ❤️"), 5)
  expect_equal(str_length("I...talk...slow"), 15)
})


#source("test-str_length.R")

