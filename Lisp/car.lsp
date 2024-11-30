(defun cuarto-elemento (lista)
  (car (cdr (cdr (cdr lista))))
)

(defun ultimos-tres ()
(cdr(cdr(cdr(cdr(cdr '(a b c d e f g h))))))
)

(defun primeros-tres(lista)
(list (car lista) (car (cdr lista))(car (cdr (cdr lista))))
)

(defun eliminar-primero-ultimos (lista)
      (eliminar-ultimo (cdr lista)))

(defun eliminar-ultimo (lista)
  (if (null (cdr lista)) ;; Si solo queda un elemento, devuelve NIL
      nil
      (cons (car lista) (eliminar-ultimo (cdr lista)))))

(defun sumar-primeros-tres (lista)
      (+ (car lista) (car (cdr lista)) (car (cdr (cdr lista)))))

(defun recorrer-lista (lista)
(if (null lista)
      (format t "Fin del recorrido.~%") ;; Caso base: la lista vacía
      (progn
        (format t "elemento de la lista: ~a~%" (car lista))
        (recorrer-lista (cdr lista)))))

(defun invertir-pares (lista)
  (if (null lista) ;; Caso base: lista vacía 
      lista
      (append (list (car (cdr lista)) (car lista)) 
              (invertir-pares (cdr (cdr lista)))))) 
