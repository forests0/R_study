f = function(x) {
  return(x^2)
}
# 미분 전 함수
f <- function(x) (x^3 + 3 * x^2 - 6 * x + 8)
curve(f, -5,  4, ylab = 'y = f(x)')

#미분 후 함수변화
g <- function(x) {}
body(g) = D(body(f), 'x')
curve(g, -5, 4, ylab = 'g(x)') # 3차함수가 미분되어 2차함수로 변한 것을 알 수 있음

# integrate()로 적분해보기
f2 = function(x) (x^2 + 1)
integrate(f2, lower = 0, upper = 1)
integrate(g, lower = 0, upper = 10)
f(10) - f(0)

newton = function(f, tol = 1e-7, x0 = 1, N = 100) {
  h = 1e-7;
  i = 1
  x1 = x0;
  p = numeric(N)
  while(i <= N) {
    df.dx = (f(x0+h) - f(x0)) / h
    p[i] = x1
    i = i + 1
    if(abs(x1 - x0) < tol) break
    x0 = x1
  }
  return(p[1 : (i - 1)])
}

f <- function(x) (x^2 - 2)
newton(f2)
f <- function(x) (x^3 + 3 * x^2 - 6 * x -8)
newton(f3)

