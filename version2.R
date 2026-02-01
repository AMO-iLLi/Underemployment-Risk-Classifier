library(readr)

# Read data
train_set <- read_csv("train.csv")
test_set  <- read_csv("test.csv")

# Helper: turn NA into a factor level label (e.g., "Missing" or "999")
na_to_level <- function(x, label) {
  x <- as.character(x)
  x[is.na(x)] <- label
  factor(x)
}

# =========================
# CERTLEVP (has 9 = Not stated (missing))
# =========================
train_set$CERTLEVP[train_set$CERTLEVP == 9] <- NA
test_set$CERTLEVP[test_set$CERTLEVP == 9]   <- NA
train_set$CERTLEVP <- na_to_level(train_set$CERTLEVP, "Missing")
test_set$CERTLEVP  <- na_to_level(test_set$CERTLEVP,  "Missing")

# =========================
# PGMCIPAP (has 99 = Not stated (missing))
# =========================
train_set$PGMCIPAP[train_set$PGMCIPAP == 99] <- NA
test_set$PGMCIPAP[test_set$PGMCIPAP == 99]   <- NA
train_set$PGMCIPAP <- na_to_level(train_set$PGMCIPAP, "Missing")
test_set$PGMCIPAP  <- na_to_level(test_set$PGMCIPAP,  "Missing")

# =========================
# PGM_P034 (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_P034[train_set$PGM_P034 %in% c(6, 9)] <- NA
test_set$PGM_P034[test_set$PGM_P034 %in% c(6, 9)]   <- NA
train_set$PGM_P034 <- na_to_level(train_set$PGM_P034, "Missing")
test_set$PGM_P034  <- na_to_level(test_set$PGM_P034,  "Missing")

# =========================
# PGM_P036 (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_P036[train_set$PGM_P036 %in% c(6, 9)] <- NA
test_set$PGM_P036[test_set$PGM_P036 %in% c(6, 9)]   <- NA
train_set$PGM_P036 <- na_to_level(train_set$PGM_P036, "Missing")
test_set$PGM_P036  <- na_to_level(test_set$PGM_P036,  "Missing")

# =========================
# HLOSGRDP (has 9 = Not stated)
# =========================
train_set$HLOSGRDP[train_set$HLOSGRDP == 9] <- NA
test_set$HLOSGRDP[test_set$HLOSGRDP == 9]   <- NA
train_set$HLOSGRDP <- na_to_level(train_set$HLOSGRDP, "Missing")
test_set$HLOSGRDP  <- na_to_level(test_set$HLOSGRDP,  "Missing")

# =========================
# PREVLEVP (has 9 = Not stated)
# =========================
train_set$PREVLEVP[train_set$PREVLEVP == 9] <- NA
test_set$PREVLEVP[test_set$PREVLEVP == 9]   <- NA
train_set$PREVLEVP <- na_to_level(train_set$PREVLEVP, "Missing")
test_set$PREVLEVP  <- na_to_level(test_set$PREVLEVP,  "Missing")

# =========================
# PGM_280A (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_280A[train_set$PGM_280A %in% c(6, 9)] <- NA
test_set$PGM_280A[test_set$PGM_280A %in% c(6, 9)]   <- NA
train_set$PGM_280A <- na_to_level(train_set$PGM_280A, "Missing")
test_set$PGM_280A  <- na_to_level(test_set$PGM_280A,  "Missing")

# =========================
# PGM_280B (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_280B[train_set$PGM_280B %in% c(6, 9)] <- NA
test_set$PGM_280B[test_set$PGM_280B %in% c(6, 9)]   <- NA
train_set$PGM_280B <- na_to_level(train_set$PGM_280B, "Missing")
test_set$PGM_280B  <- na_to_level(test_set$PGM_280B,  "Missing")

# =========================
# PGM_280C (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_280C[train_set$PGM_280C %in% c(6, 9)] <- NA
test_set$PGM_280C[test_set$PGM_280C %in% c(6, 9)]   <- NA
train_set$PGM_280C <- na_to_level(train_set$PGM_280C, "Missing")
test_set$PGM_280C  <- na_to_level(test_set$PGM_280C,  "Missing")

# =========================
# PGM_280F (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_280F[train_set$PGM_280F %in% c(6, 9)] <- NA
test_set$PGM_280F[test_set$PGM_280F %in% c(6, 9)]   <- NA
train_set$PGM_280F <- na_to_level(train_set$PGM_280F, "Missing")
test_set$PGM_280F  <- na_to_level(test_set$PGM_280F,  "Missing")

# =========================
# PGM_P401 (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PGM_P401[train_set$PGM_P401 %in% c(6, 9)] <- NA
test_set$PGM_P401[test_set$PGM_P401 %in% c(6, 9)]   <- NA
train_set$PGM_P401 <- na_to_level(train_set$PGM_P401, "Missing")
test_set$PGM_P401  <- na_to_level(test_set$PGM_P401,  "Missing")

# =========================
# STULOANS (has 6 = valid skip, 9 = not stated)
# =========================
train_set$STULOANS[train_set$STULOANS %in% c(6, 9)] <- NA
test_set$STULOANS[test_set$STULOANS %in% c(6, 9)]   <- NA
train_set$STULOANS <- na_to_level(train_set$STULOANS, "Missing")
test_set$STULOANS  <- na_to_level(test_set$STULOANS,  "Missing")

# =========================
# DBTOTGRD (has 6 = valid skip, 9 = not stated)
# =========================
train_set$DBTOTGRD[train_set$DBTOTGRD %in% c(6, 9)] <- NA
test_set$DBTOTGRD[test_set$DBTOTGRD %in% c(6, 9)]   <- NA
train_set$DBTOTGRD <- na_to_level(train_set$DBTOTGRD, "Missing")
test_set$DBTOTGRD  <- na_to_level(test_set$DBTOTGRD,  "Missing")

# =========================
# SCHOLARP (has 6 = valid skip, 9 = not stated)
# =========================
train_set$SCHOLARP[train_set$SCHOLARP %in% c(6, 9)] <- NA
test_set$SCHOLARP[test_set$SCHOLARP %in% c(6, 9)]   <- NA
train_set$SCHOLARP <- na_to_level(train_set$SCHOLARP, "Missing")
test_set$SCHOLARP  <- na_to_level(test_set$SCHOLARP,  "Missing")

# =========================
# VISBMINP (has 9 = not stated)
# =========================
train_set$VISBMINP[train_set$VISBMINP == 9] <- NA
test_set$VISBMINP[test_set$VISBMINP == 9]   <- NA
train_set$VISBMINP <- na_to_level(train_set$VISBMINP, "Missing")
test_set$VISBMINP  <- na_to_level(test_set$VISBMINP,  "Missing")

# =========================
# PAR1GRD (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PAR1GRD[train_set$PAR1GRD %in% c(6, 9)] <- NA
test_set$PAR1GRD[test_set$PAR1GRD %in% c(6, 9)]   <- NA
train_set$PAR1GRD <- na_to_level(train_set$PAR1GRD, "Missing")
test_set$PAR1GRD  <- na_to_level(test_set$PAR1GRD,  "Missing")

# =========================
# PAR2GRD (has 6 = valid skip, 9 = not stated)
# =========================
train_set$PAR2GRD[train_set$PAR2GRD %in% c(6, 9)] <- NA
test_set$PAR2GRD[test_set$PAR2GRD %in% c(6, 9)]   <- NA
train_set$PAR2GRD <- na_to_level(train_set$PAR2GRD, "Missing")
test_set$PAR2GRD  <- na_to_level(test_set$PAR2GRD,  "Missing")

# =========================
# BEF_P140 (has 9 = not stated)
# =========================
train_set$BEF_P140[train_set$BEF_P140 == 9] <- NA
test_set$BEF_P140[test_set$BEF_P140 == 9]   <- NA
train_set$BEF_P140 <- na_to_level(train_set$BEF_P140, "Missing")
test_set$BEF_P140  <- na_to_level(test_set$BEF_P140,  "Missing")

# =========================
# BEF_160 (numeric, has 99 = not stated (missing))
# Algorithm says: turn NA into missing category if described. Here, "Missing".
# We'll convert 99 -> NA, then NA -> "Missing" (categorical-ize it).
# =========================
train_set$BEF_160[train_set$BEF_160 == 99] <- NA
test_set$BEF_160[test_set$BEF_160 == 99]   <- NA
train_set$BEF_160 <- na_to_level(train_set$BEF_160, "Missing")
test_set$BEF_160  <- na_to_level(test_set$BEF_160,  "Missing")

# =========================
# GRADAGEP (no missing mentioned) -> NA becomes "999"
# =========================
train_set$GRADAGEP <- na_to_level(train_set$GRADAGEP, "999")
test_set$GRADAGEP  <- na_to_level(test_set$GRADAGEP,  "999")

# =========================
# GENDER2 (no missing mentioned) -> NA becomes "999"
# =========================
train_set$GENDER2 <- na_to_level(train_set$GENDER2, "999")
test_set$GENDER2  <- na_to_level(test_set$GENDER2,  "999")

# =========================
# CTZSHIPP (no missing mentioned) -> NA becomes "999"
# =========================
train_set$CTZSHIPP <- na_to_level(train_set$CTZSHIPP, "999")
test_set$CTZSHIPP  <- na_to_level(test_set$CTZSHIPP,  "999")

# =========================
# DDIS_FL (no missing mentioned) -> NA becomes "999"
# =========================
train_set$DDIS_FL <- na_to_level(train_set$DDIS_FL, "999")
test_set$DDIS_FL  <- na_to_level(test_set$DDIS_FL,  "999")
