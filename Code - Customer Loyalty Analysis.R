#Load Library
library(readxl)
library(tidyverse)
library(caret)
library(olsrr)
library(lmtest)
library(car)

#Load Data
df <- read_excel("C:/Users/yiesha/Downloads/Loyalty.xlsx")
names(df) = c('Loyalty','Price','Quality',
                   'Trust','Satifaction', 'Negative_publicity')
head(df)

#Splitting Data
random_sample <- createDataPartition(df$Loyalty, 
                                     p = 0.7, list = FALSE)

train  <- df[random_sample, ] #Data for Training
test <- df[-random_sample, ] #Data for Testing

#Menyimpan hasil split data
write.csv(train, "C:/Users/yiesha/Downloads/Loyalty_train.csv", row.names = FALSE)
write.csv(test, "C:/Users/yiesha/Downloads/Loyalty_test.csv",  row.names = FALSE)

#Model Awal
model <- lm(formula =Loyalty ~ Price + Quality +
            Trust + Satifaction + Negative_publicity
            , data = train)
summary(model)

#Stepwise----
model1 = lm(Loyalty~Quality, data = train)
summary(model1)
ols_mallows_cp(model1, model)
AIC(model1)
ols_sbic(model1, model)

model2 = lm(Loyalty~Quality+Trust, data = train)
summary(model2)
ols_mallows_cp(model2, model)
AIC(model2)
ols_sbic(model2, model)

model3 = lm(Loyalty ~ Quality + Trust + Negative_publicity , data=train)
summary(model3)
ols_mallows_cp(model3, model)
AIC(model3)
ols_sbic(model3, model)

model4 = lm(Loyalty ~ Quality + Trust + Negative_publicity + Satifaction, data=train)
summary(model4)
ols_mallows_cp(model4, model)
AIC(model4)
ols_sbic(model4, model)

model5 = lm(Loyalty ~ Quality + Trust + Satifaction + Negative_publicity + Price, data=train)
summary(model5)
ols_mallows_cp(model5, model)
AIC(model5)
ols_sbic(model5, model)

ols_step_best_subset(model5)
#----

#VIF
vif(model)

#Model with Interaction
model_int = lm(formula = Loyalty ~ Price + Quality +
                         Trust + Satifaction + Negative_publicity+Price*Trust, 
                       data = train)
summary(model_int)
anova(model, model_int, test = 'F')
ols_mallows_cp(model_int, model)
AIC(model_int)
ols_sbic(model_int, model)

#Test Data
## Model without interaction
predictions <- predict(model, test)
data.frame( R2 = R2(predictions, test$Loyalty),
            RMSE = RMSE(predictions, test $ Loyalty),
            MAE = MAE(predictions, test $ Loyalty))

## Model with interaction
predictions2 <- predict(model_int, test)
data.frame( R2 = R2(predictions2, test$Loyalty),
            RMSE = RMSE(predictions2, test $ Loyalty),
            MAE = MAE(predictions2, test $ Loyalty))

#ASUMSI
modelresidual = model_int$residuals

hist(modelresidual)
qqnorm(modelresidual)
qqline(modelresidual)

bptest(model_int)

plot(model_int)
dwtest(model_int)
