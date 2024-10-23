(defun div (a b)
  (if (< a b)
      0  ; No hay division posible
      (+ 1 (div (- a b) b)))) ; 

(defun multi (x y)
  (if (= y 0)
      0  ; Mult por 0
      (+ x (multi x (- y 1))))) ; 

(defun potencia (x n)
  (if (= n 0)
      1  ; n a la potencia 0 es 1
      (multi x (potencia x (- n 1))))) ; 
