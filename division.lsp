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

(defun multiply (x y)
  (if (= y 0)
      0  ; multiplicación por 0
      (+ x (multiply x (- y 1))))) 

(defun power (x n)
  (if (= n 0)
      1  ; Cualquier número a la potencia 0 es 1
      (multiply x (power x (- n 1))))) ; 



