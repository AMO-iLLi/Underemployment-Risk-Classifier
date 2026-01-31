library(tidyverse)
library(ranger)
library(randomForest)

set.seed(345)

sample_submission <- read_csv("sample_submission.csv")
test_set <- read_csv("test.csv")

train_set <- read_csv(
  "train.csv",
  col_types = cols(
    id            = col_double(),
    
    # Target
    overqualified = col_double(),
    
    # Education & Program Features
    CERTLEVP  = col_factor(),
    PGMCIPAP  = col_factor(),
    PGM_P034  = col_factor(),
    PGM_P036  = col_factor(),
    HLOSGRDP  = col_factor(),
    PREVLEVP  = col_factor(),
    
    # Program Experience
    PGM_280A  = col_factor(),
    PGM_280B  = col_factor(),
    PGM_280C  = col_factor(),
    PGM_280F  = col_factor(),
    PGM_P401 = col_factor(),
    
    # Financial
    STULOANS  = col_factor(),
    DBTOTGRD = col_factor(),
    SCHOLARP = col_factor(),
    
    # Demographic
    GRADAGEP = col_factor(),
    GENDER2  = col_factor(),
    CTZSHIPP = col_factor(),
    VISBMINP = col_factor(),
    DDIS_FL  = col_factor(),
    
    # Parental education
    PAR1GRD = col_factor(),
    PAR2GRD = col_factor(),
    
    # Pre-program work
    BEF_P140 = col_factor(),
    BEF_160  = col_double(),
    overqualified = col_factor()
  )
)



n <- nrow(train_set)

prop_train <- 0.75
prop_test <- 0.25

train_test <- sample(c("Train", "Test"),
                     size = n, replace = TRUE, 
                     prob = c(prop_train, prop_test))

training_data <- train_set[train_test == "Train", ]
testing_data <- train_set[train_test == "Test",]


pro_rf <- randomForest(
  data = drop_na(training_data), y = drop_na(training_data)$overqualified,
  x = drop_na(training_data[, -("id", "overqualified")]),
  importance = TRUE, ntree = 1000, mtry = n/3,
  keep.forest = TRUE, 
)
pro_rf # Barely useful here
summary(pro_rf) # Not useful here.

# Default plot method shows OOB error vs. number of trees.

plot(pro_rf, main = "OOB Error")


plot(pro_rf, xlim = c(50, 1000), ylim = c(0.6, 0.8))

# Histogram of tree sizes

hist(treesize(pro_rf))


library(randomForest)
library(dplyr)

set.seed(123)

pro_rf <- randomForest(
  overqualified ~ . - id,
  mtry = 9,
  data = training_data %>% drop_na(),
  importance = TRUE,
  ntree = 1000,
  keep.forest = TRUE
)

print(pro_rf)
varImpPlot(pro_rf)


all_mtry <- c(6,7,8,9,10,11)
all_nodesize <- c(1,2,3,5,8,10,15,20)
all_pars <- expand.grid(mtry = all_mtry, nodesize = all_nodesize)
n_pars <- nrow(all_pars)

