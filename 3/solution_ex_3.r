seeds <- c(231, 308, 344, 200, 172, 456, 191, 296, 142, 373, 316, 226, 173, 188, 259, 228, 197, 110, 161, 260, 127, 180, 387, 240, 163, 261, 212, 293, 12, 241)
mean(seeds)


Therefore, the point estimation for m is 233.07.


(b) To compute the 95% confidence interval for m, we need to use the t-distribution. Since the sample size is small (n = 30), 
we should use a t-distribution instead
of a z-distribution. The degrees of freedom is n - 1 = 29. We can calculate the confidence interval in R using the following code:
n <- length(seeds)
t <- qt(0.975, df = n - 1)
se <- sqrt(10000 / n)
mean(seeds) + t * se * c(-1, 1)
Therefore, the 95% confidence interval for m is (186.46, 279.67)
