#-------------------#
#BOSTON_DATASET
install.packages("tidyverse")
install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)
library(readr)
boston <- read_csv("~/Downloads/Stanford CSVs/boston.csv")

colnames(boston) <- tolower(colnames(boston))


names(boston)
attach(boston)
cor(boston)

#I want to find what correlates to house prices

plot(medv~lstat, boston)

fit1 <- lm(medv~lstat, data=boston);summary(fit1);abline(fit1, col = "red")

confint(fit1)

predict(fit1,data.frame(lstat=(c(5,10,15))), interval="confidence")

fit2 <- lm(medv~lstat + age, data = boston);summary(fit2)

fit3 <- lm(medv~.,data = boston);summary(fit3)
plot(fit3)


#Using minus because many variables have low P Value except a few
fit4 <- update(fit3,~.-age-indus)

#Trying different variables combination
fit4a <- lm(medv~lstat + nox, data = boston); summary(fit4a)
fit4b <- lm(medv~lstat + chas + rm, data = boston); summary(fit4b)
fit4c <- lm(medv~lstat + chas + rm +ptratio, data = boston); summary(fit4c)
fit4d <- lm(medv~lstat*ptratio, data = boston); summary(fit4d)
fit4e <- lm(medv~lstat*chas, data = boston); summary(fit4e)
fit4f <- lm(medv~lstat*rm, data = boston); summary(fit4f)
fit4g <- lm(medv~lstat*crim, data = boston); summary(fit4g)

#CONCLUSION:
#1. The housing price correlated negatively with lower status population

#2.The more room, the more expensive the house get.
#But more room in poor area confuse people  
#and eventually become a liability and decrease the price value

#3. Area with lower pt-ratio shows an indication of more focused/elite schooling.
#Elite Schooling means elite area, the house price become more expensive.

#4. More criminal & lower stats pop area decrease house prices individually
# but the combination of both diminish the negative trend slightly

par(mfrow=c(2,2))
#Testing age variable
fit5 <- lm(medv~lstat*age,boston);summary(fit5)

#Modelling for squared lstat for exponential decrease in medv after certain threshold
fit6 <- lm(medv~lstat + I(lstat^2),boston); summary(fit6)

fit7 <- lm(medv~poly(lstat,4))
fit8 <- lm(medv~rm,boston); summary(fit8)
fit9 <- lm(medv~rm + I(rm^2),boston); summary(fit9)

par(mfrow=c(1,1))

plot(medv~lstat)

points(lstat, fitted(fit1), col="orange",pch=20)
points(lstat, fitted(fit4b), col="red",pch=20)
points(lstat,fitted(fit6), col="blue", pch=20)
points(lstat,fitted(fit7), col="green", pch=20)


#I want to find out what correlates to crimes

fit10 <- lm(crim~.,boston); summary(fit10)
fit11 <- lm(crim~rad,boston); summary(fit11)
fit12 <- lm(crim~dis,boston); summary(fit12)
fit13 <- lm(crim~dis+rad+b,boston); summary(fit13)
fit14 <- lm(crim~dis+rad,boston); summary(fit14)
fit15 <- lm(crim~dis*rad,boston); summary(fit15)
fit16 <- lm(crim~dis*b,boston); summary(fit16)
fit17 <- lm(crim~dis*zn,boston); summary(fit17)

plot(crim~rad)

points(rad,fitted(fit10), col="yellow", pch=20)
points(rad,fitted(fit11), col="red", pch=20)

#CONCLUSION:
#1. Fit14 = Urban area shows higher crime rate by the correlation of more radial roads
# and correlates negatively with employment area. 
# Meaning the more the distance from the urban area the less crime it gets. 

# 
# 2. Fit15 = The prior model shows the farther you are from urban centers the less crime.
# But when including interaction. People who are in sub-urban and no radial road access
# are prone socio-economic stress that's why crime tend to raise 

# 3. Fit16 = crime increases more strongly when 
# far from jobs and there's a larger Black population.

# 4. Fit17 = Lower zn means more urban and more urban more crime.
# When zn and dis is high meaning in rural areas where there's 
# economic distress lead to higher crime. In this context building and 
#connecting roads are essentials to prevent crime

#Checking for multicollinearity in crime factors
install.packages("car")
library(car)
vif(fit14)  # Variance Inflation Factor

hist(crim)
#dis, nox, b,zn
