#---- tillers

# Maximum numbers of stages
m <- 50
# new tillers 
t <- numeric(m)
t[1] <- 1
t[2] <- 1
for(n in 3:m)
{
  t[n] <- t[n-1] + t[n-2]
}
# total number of tillers
tt <- numeric(m)
for(n in 1:m)
{
  tt[n] <- sum(t[1:n])
}