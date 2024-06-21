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
