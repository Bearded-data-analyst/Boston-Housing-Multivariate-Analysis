# Load data
library(MASS)
library(boot)
names(Boston)

# Fit model lstat
glm.fit <- glm(medv ~ lstat, data = Boston)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error <- cv.glm(Boston, glm.fit)

# Print LOOCV MSE
cv.error$delta


# Store LOOCV errors for degree 1 to 5
cv.error <- rep(0, 10)

for (d in 1:10) {
  glm.fit <- glm(medv ~ poly(lstat, d), data = Boston)
  cv.error[d] <- cv.glm(Boston, glm.fit)$delta[1]
}

# Print results
cv.error


# Fit model ptratio
glm.fit2 <- glm(medv ~ ptratio, data = Boston)
coef(glm.fit2)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error2 <- cv.glm(Boston, glm.fit2)

# Print LOOCV MSE
cv.error2$delta


# Store LOOCV errors for degree 1 to 5
cv.error2 <- rep(0, 5)

for (d in 1:5) {
  glm.fit2 <- glm(medv ~ poly(ptratio, d), data = Boston)
  cv.error2[d] <- cv.glm(Boston, glm.fit2)$delta[1]
}

# Print results
cv.error2


# Fit model rm
glm.fit3 <- glm(medv ~ rm, data = Boston)
coef(glm.fit3)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error3 <- cv.glm(Boston, glm.fit3)

# Print LOOCV MSE
cv.error3$delta


# Store LOOCV errors for degree 1 to 5
cv.error3 <- rep(0, 10)

for (d in 1:10) {
  glm.fit3 <- glm(medv ~ poly(rm, d), data = Boston)
  cv.error3[d] <- cv.glm(Boston, glm.fit3)$delta[1]
}

# Print results
cv.error3


# Fit model dis
glm.fit4 <- glm(medv ~ dis, data = Boston)
coef(glm.fit4)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error4 <- cv.glm(Boston, glm.fit4)

# Print LOOCV MSE
cv.error4$delta


# Store LOOCV errors for degree 1 to 5
cv.error4 <- rep(0, 10)

for (d in 1:10) {
  glm.fit4 <- glm(medv ~ poly(dis, d), data = Boston)
  cv.error4[d] <- cv.glm(Boston, glm.fit4)$delta[1]
}

# Print results
cv.error4


# Fit model nox
glm.fit5 <- glm(medv ~ nox, data = Boston)
coef(glm.fit5)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error5 <- cv.glm(Boston, glm.fit5)

# Print LOOCV MSE
cv.error5$delta


# Store LOOCV errors for degree 1 to 5
cv.error5 <- rep(0, 10)

for (d in 1:10) {
  glm.fit5 <- glm(medv ~ poly(nox, d), data = Boston)
  cv.error5[d] <- cv.glm(Boston, glm.fit5)$delta[1]
}

# Print results
cv.error5


# Fit more varible
glm.fit6 <- glm(medv ~lstat+ nox+ptratio+tax+black+rad+dis+rm+nox+chas+zn+crim+indus, data = Boston)
coef(glm.fit6)


# LOOCV (default K = n, so it's Leave-One-Out)
cv.error6 <- cv.glm(Boston, glm.fit6)

# Print LOOCV MSE
cv.error6$delta

cv.error6 <- rep(0, 10)

for (d in 1:10) {
  glm.fit6 <- glm(medv ~ poly(lstat, d) + poly(rm, d) + ptratio + nox+ tax + black + rad + dis + chas + zn + crim ,
                  data = Boston)
  cv.error6[d] <- cv.glm(Boston, glm.fit6)$delta[1]
}

cv.error6

# Plot LOOCV errors
plot(degree, cv.error6, type = "b", pch = 19, col = "darkblue",
     xlab = "Degree of Polynomial",
     ylab = "LOOCV Error",
     main = "LOOCV Error for Polynomial Fits with Multiple Predictors")


# Simplify variable
glm.fit7 <- glm(medv ~lstat+rm, data = Boston)
coef(glm.fit7)


# LOOCV (default K = n, so it's Leave-One-Out)
cv.error7 <- cv.glm(Boston, glm.fit7)

# Print LOOCV MSE
cv.error7$delta

cv.error7 <- rep(0, 10)

for (d in 1:10) {
  glm.fit7 <- glm(medv ~ poly(lstat, d) + poly(rm, d),
                  data = Boston)
  cv.error7[d] <- cv.glm(Boston, glm.fit7)$delta[1]
}

cv.error7


#Conclusion the best one i can fine is the model 6

# Simplify variable
glm.fit8 <- glm(medv ~lstat+rm+ptratio+indus+tax, data = Boston)
coef(glm.fit8)


# LOOCV (default K = n, so it's Leave-One-Out)
cv.error8 <- cv.glm(Boston, glm.fit8)

# Print LOOCV MSE
cv.error8$delta

cv.error8 <- rep(0, 10)

for (d in 1:10) {
  glm.fit8 <- glm(medv ~ lstat+rm+ptratio+indus+tax,
                  data = Boston)
  cv.error8[d] <- cv.glm(Boston, glm.fit8)$delta[1]
}

cv.error8



# Fit model lstat*rm
glm.fit8 <- glm(medv ~ lstat*rm, data = Boston)

# LOOCV (default K = n, so it's Leave-One-Out)
cv.error8 <- cv.glm(Boston, glm.fit8)

# Print LOOCV MSE
cv.error8$delta


# Store LOOCV errors for degree 1 to 5
cv.error8 <- rep(0, 10)

for (d in 1:10) {
  glm.fit8 <- glm(medv ~ poly(lstat, d) * poly(rm, d), data = Boston)
  cv.error8[d] <- cv.glm(Boston, glm.fit8)$delta[1]
}
cv.error8