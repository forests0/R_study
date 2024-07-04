name <- c("김철수", "김영희", "이철수", "이영희", "홍길동")
grade <- c(1, 4, 3, 2, 1)
gender <- c(" M", "F", "M", "F", "M")
student <- data.frame(name, grade, gender)
student

midterm = c(74, 82, 67, 89, 92)
final = c(91, 77, 88, 78, 86)
scores = cbind(midterm, final)
scores

rt <- c(TRUE, FALSE, FALSE, TRUE, FALSE)
students <- data.frame(student, scores, retake = rt)
students

total.scores <- midterm + final
cbind(students, total.scores)

a <- data.frame(name="Jane Eyre", grade=4, gender="F", 
                midterm=90, final=85, retake=F)
a

rbind(students, a)

typeof(students)

attributes(students)

students$gender
students[[5]]
students$name
typeof(students$name)

students$midterm * 2
sum(students$midterm)
students$midterm[5] <- 50
students[[4]][3:5]

students$hw <- c(8, 9, 7, 8, 10)
students

students.new <- students[1:2]
students.new

height <- c(172, 167, 181, 162, 178)
students.new <- data.frame(students[2:3], height=height)
students.new

a <- students[2]
a
typeof(a)
attributes(a)

a <- students[[2]]
a
typeof(a)
attributes(a)

students[2:3,]
students[,4]

order(students$grade)

students[order(students$grade), ]

x <- c(7, 9, NA, 5, 2)
x[x>6]

subset(x, x> 6)

y <- 1:5
z <- -1:-5
long.name <- data.frame(x, y, z)
long.name

subset(long.name, x>6)

long.name[long.name$x >6, 2:3]
subset(long.name, x>6, y:z)

lapply(students[4:5], mean)
sapply(students[4:5], mean)

nrow(students)
ncol(students)
t(students)

apply(students, 2, mean)
apply(students[4:5], 2, mean)

nrow(iris)
head(iris)
tail(iris)

sr <- read.csv('C:/Users/NGY/Desktop/Rstudy/suicide_rates.csv')
nrow(sr)
head(sr)

Sys.getlocale()

sr2 <- read.table(file="C:/Users/NGY/Desktop/Rstudy/suicide_rates.csv", header=TRUE, sep=",", fileEncoding="UTF-8")
nrow(sr2)
head(sr2)

prov.scores <- read.table("scores.txt", header=TRUE, fileEncoding="UTF-8")
prov.scores

install.packages("readxl")
library(readxl)
project <- read_excel("C:/Users/NGY/Desktop/Rstudy/dataMerge.xlsx", sheet = "project") 
project

project <- read_excel("C:/Users/NGY/Desktop/Rstudy/dataMerge.xlsx") 
project

sr$Avg <- (sr$Males + sr$Females) / 2
head(sr)
write.csv(sr, file = "C:/Users/NGY/Desktop/Rstudy/sr.csv")

install.packages("writexl")
library(writexl)
write_xlsx(students, "C:/Users/NGY/Desktop/Rstudy/students1.xlsx")
write_xlsx(list(students=students, sr=sr, project=project), "C:/Users/NGY/Desktop/Rstudy/multipleData.xlsx")

x <- 1:3; x
y <- matrix(4:12, nrow=3, ncol=3); y
z <- data.frame(x, y); z
save(x, y, z, file = "C:/Users/NGY/Desktop/Rstudy/xyz.RData")

rm(x, y, z)
x; y; z

load("C:/Users/NGY/Desktop/Rstudy/xyz.RData")
x; y; z

search()
obj <- ls()
rm(list=obj[which(obj != "students")])
ls()

rm(obj)
objects()

retake

attach(students)
retake

search()

retake[1] <- NA
retake

students$retake

detach(students)
search()
