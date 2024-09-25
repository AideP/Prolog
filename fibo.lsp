(defun fibonacci (n)
  (if (or (= n 1) (= n 2))  
      1
      (+ (fibonacci (- n 1)) (fibonacci (- n 2))))) ; 


(defun div (a b)
  (if (< b a)  
      0
      (+ 1 (div (- a b))))) ; 

      
  
  
  
