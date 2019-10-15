d <- tempfile()
dir.create(d)

# A file path not representable in latin-1
f <- file.path(d, "tricky-\u0151")
cat("foobar\n", file = f)

expect_identical(digest::digest(file = f), "d881b69b0aca33bcf5dbc7dc5c448cc2")

unlink(d, recursive = TRUE)
