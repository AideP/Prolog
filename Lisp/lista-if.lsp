;;Hacer el recorrido del descabechamiento de una lista usando if
(defun recorrer-lista (lista)
  (if (null lista) ;; Condicion base: lista vacía
      (format t "La lista está vacía.~%")
      (progn
        (format t "Elemento actual: ~a~%" (car lista))
        (recorrer-lista (cdr lista)))))