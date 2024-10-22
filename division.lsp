      int division(int a, int b) {
  if (b > a) {
    return 0; //no hay división posible
  } else {
    return 1 + division(a - b, b);
  }
}

(defun div (a b)
  (if (< a b)
      0  ; no hay división posible
      (+ 1 (div (- a b) b)))) ; Llamada recursiva restando b de a


function multi(x, y):
    if y == 0:
        return 0
    else:
        return x + multi(x, y-1)

function potencia(x, n):
    if n == 0:
        return 1
    else:
        return multi(x, potencia(x, n-1))


