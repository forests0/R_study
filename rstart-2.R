y <- c(2, 4, 6, 8, 10)
y

a <- c(T, F, T);
a

students <- c("길동", "철수", "Tom")
students

1:10

seq(length=10, from = -3, by = 0.5)

rep(1, times = 10)

x <- 1:5
y <- c(2, 4, 6, 8, 10)

x + y
x + (y - 1)

y <- 1:5
y > 3
y >= 3
y == 2

b <- !a; b

any( c(F, F, F) )
any( c(F, F, T) )

all( c(T, T, T) )
all( c(F, T, T) )

x <- c(T, F, F, T, F)
a <- 1:5
b <- -1:-5
y <- ifelse(x, a, b); y

ifelse(y > 0, y, 0)

n <- 1:3
n
num <- as.character(n)
num

paste(students, num)
paste(students, num, sep="-")
paste(students, num, c("A", "B", "C"), "!")

x <- c("2015-3-15 10:12:12", "2016-10-11 11:12:13", 
       "2014-7-8 02:03:04")
strsplit(x, split=" ")
strsplit(x, split="-")

nchar("날짜")
a <- c("날짜", "day", "date", "날짜와 시간")
nchar(a)

z <- c(11:13, NA)
z
is.na(z)
na.omit(z)
sum(z, na.rm=TRUE)

1/0
Inf * 5
0/0
Inf - Inf

z <- -1:1 / 0
z
is.na(z)

r <- c(z, NA)
r
is.na(r)
is.nan(r)

x <- 11:20
x[6]
x[rep(c(2,4), times=3)]

x[-2]

x <- 1:5
y <- c(T, F, T, T, F)
x[y]
x > 3
x[x>3]
x[x >3 & x <5]

animals <- c(5, 7, 3, 2)
names(animals) <- c("cats", "dogs", "camels", "donkeys")
animals
animals[c("dogs","donkeys")]

n <- 1:10
n
m <- matrix(n, nrow=2, ncol=5)
m

matrix(n, nrow=2, ncol=5, byrow=T)
attributes(m)

m <- matrix(n, nrow=5, ncol=2)
m

attributes(m)

m <- matrix(1:9, nrow=3, ncol=3)
m

cbind(1:5, 10:6)
rbind(1:5, 10:6, 11:15)

A <- matrix(1:9, nrow=3, ncol=3)
cbind(A, 10:12)

rbind(10:12, A)

z <- matrix(1:25, nrow=5, ncol=5)
z
z[1,1]
z[1:3,1]
z[,2]
z[,c(3,5)]
z[,-2]

z[5:1, ]

a <- matrix(sample(1:16), nrow=4, ncol=4)
a
a[,1]
order(a[,1])
a[order(a[,1]), ]


height <- c(180, 172, 167, 175, 182)
weight <- c(72, 78, 58, 64, 68)
year <- c(1, 3, 2, 4, 2)
A <- cbind(height, weight, year)
A[ , c(F, T, T)]
A[ A[,1] > 180,  ]

colnames(A)
rownames(A)
rownames(A) <- paste("student", 1:5, sep="")
A

z
z[10]
z[z>15]

A <- matrix(1:9, nrow=3, ncol=3)
A
B <- matrix(seq(from=10, length=9, by=10), nrow=3, ncol=3)
B

A + B

C <- cbind(A, 10:12)
C

C + B

a <- 9:1
a + A

a <- c(0, 10, 100)
a + A


A <- matrix(1:4, nrow=2, ncol=2)
A
t(A)

nrow(A)

ncol(A)

dim(A)

attributes(A)

rownames(A)

colnames(A)

rownames(A) <- c("upper", "lower")
colnames(A) <- c("left", "right")
A

X <- rbind(1:5, 5:1)
X

x <- as.vector(X)
x

set.seed(123)
a <- sample(1:25)
a

A <- matrix(a, nrow=5, ncol=5)
A
apply(A, 1, sum)
apply(A, 2, sum)


colnames(A) <- LETTERS[1:5]
rownames(A) <- paste("X", 1:5, sep="")
A

apply(A, 1, min)

x <- array(11:28, dim=c(3, 3, 2))
x

x[2, 1, 1]
x[2, 1, 2]

x <- array(1, dim=c(2, 3, 2))
x

x <- array(1:5, dim=c(3, 3, 2))
x

y <- array(1:30, dim=c(2, 3, 2, 2))
y

typeof(x)
class(x)
attributes(x)

x <- 1:12
dim(x)

x
dim(x) <- c(3, 4)
x

dim(x) <- c(2, 3, 2)
x

dim(x) <- c(2, 3, 2)
dimnames(x) <- list(c("A", "B"), 
                    paste("group",1:3,sep="-"), 
                    c("Male", "Female"))
x


a <- array(1:8, c(2, 2, 2)); a
b <- array(10^(0:7), c(2, 2, 2)); b

d <- array(11:30, c(2, 3, 2)); d
a + d

2 * a

x
x[ , , 2]
x[1, 2:3, 2]

A <- array(1:4, c(2,2)); A
B <- array(10^(0:3), c(2,2)); B
A * B
A %*% B

x <- c(1,1)
x %*% A

A %*% x

diag(A)
diag(1:4)

A <- matrix(c(2, -2, -3, 4), nrow=2, ncol=2); A
b <- c(5, -4); b

x <- solve(A, b); x
A %*% x

A
ev <- eigen(A)
ev$values
ev$vectors
ev

eigen(A, only.values = TRUE)

b <- list(1:5, 21:29, seq(2, 20, by=2))
b
lapply(b, mean)
names(b) <- c("A", "B", "C")
lapply(b, range)

sapply(b, length)
sapply(b, range)

sapply(b, function(x){
  sum(x > 10)
})
mapply(c, a, b)

x <- lm(dist~speed, data=cars)
x
class(x)
names(x)
x$residuals
x$terms

unclass(x)
