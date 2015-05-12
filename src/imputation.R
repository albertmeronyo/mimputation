# Set working dir
setwd('/Users/Albert/src/mimputation')

# Data load; empty strings are NAs
df <- read.csv('data/cedar_vt_1859.csv', na.strings = c("", "NA"))
df$area <- as.factor(df$area)
df$sex <- as.factor(df$sex)
# df$houseType <- as.factor(df$houseType)
df$houseType <- NULL
df$resStatus <- as.factor(df$resStatus)
df$population <- as.numeric(df$population)

# 1. Target variable is 'population', imputation of its NAs
# Explanatory: all categorical
# Response: continuous
# Model: Linear regression

# Dummy coding categorical variables into numeric ones
df$d.area <- as.numeric(df$area)
df$d.sex <- as.numeric(df$sex)
df$d.resStatus <- as.numeric(df$resStatus)

plot(df$d.sex, log(df$population), main='Population by sex', xlab='Sex', ylab='Population (log)')
mod <- lm(population ~ d.area + d.sex + d.resStatus, data=na.omit(df))
summary(mod)
predict(mod, df[is.na(df$population), ])
df[15394,]
