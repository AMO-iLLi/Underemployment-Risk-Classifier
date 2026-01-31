# Load
# Load
train <- read.csv("train.csv")
test  <- read.csv("test.csv")

# Remove target column from train
train <- train[, !(names(train) %in% "overqualified")]

# NA percentage per column (train)
na_pct <- colMeans(is.na(train)) * 100
print(sort(na_pct))

low_na_cols  <- names(na_pct[na_pct <= 5])
high_na_cols <- names(na_pct[na_pct > 5])

# Drop rows with NA in low-NA columns
train <- train[complete.cases(train[, low_na_cols]), ]
test  <- test[complete.cases(test[, low_na_cols]), ]

# Fill NA in high-NA columns:
# - numeric -> median
# - non-numeric -> mode
for (col in high_na_cols) {
  if (is.numeric(train[[col]])) {
    fill_val <- median(train[[col]], na.rm = TRUE)
  } else {
    fill_val <- names(sort(table(train[[col]]), decreasing = TRUE))[1]
  }
  train[[col]][is.na(train[[col]])] <- fill_val
  test[[col]][is.na(test[[col]])]   <- fill_val
}

# Checks
dim(train)
dim(test)
any(is.na(train))
any(is.na(test))

