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



