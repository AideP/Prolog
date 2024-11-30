(defun cuarto-elemento (lista)
  (car (cdr (cdr (cdr lista))))
)

(defun ultimos-tres ()
(cdr(cdr(cdr(cdr(cdr '(a b c d e f g h))))))
)

(defun primeros-tres(lista)
(list (car lista) (car (cdr lista))(car (cdr (cdr lista))))
)

