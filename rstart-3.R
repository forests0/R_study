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
