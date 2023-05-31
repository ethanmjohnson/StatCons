pacman::p_load(pwr)


r2 = 0.1 #r^2 value
p = 5
k = p + 1 # number of predictors plus intercept
power = 0.9 # power
sig = 0.05 # significance level

# f2 calculation
f2 = r2/(1-r2)

# power test to find v (n-p degrees of freedom, n = sample size, p = # of predictors)
v = pwr.f2.test(u = k-1, v = NULL, f2 = f2, sig.level = sig, power = power)$v

# sample size
n = ceiling(v + k)
n

