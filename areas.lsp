(defun mostrar-menu ()
  (format t "Selecciona una figura geométrica:~%")
  (format t "1. Cuadrado~%")
  (format t "2. Rectángulo~%")
  (format t "3. Triángulo~%")
  (format t "4. Círculo~%")
  (format t "5. Pentágono~%")
  (format t "6. Hexágono~%")
  (format t "7. Trapecio~%")
  (format t "8. Elipse~%")
  (format t "9. Paralelogramo~%")
  (format t "10. Rombo~%"))

(defun leer-opcion ()
  (format t "Elige una opción (1-10): ")
  (read))

(defun cuadrado ()
  (format t "Introduce la longitud del lado del cuadrado: ")
  (let ((lado (read)))
    (let ((area (* lado lado))
          (perimetro (* 4 lado)))
      (format t "Área del cuadrado: ~a~%" area)
      (format t "Perímetro del cuadrado: ~a~%" perimetro))))

(defun calcular-area-perimetro ()
  (mostrar-menu)
  (let ((opcion (leer-opcion)))
    (cond
      ((= opcion 1) (cuadrado))

      (t (format t "Opción inválida.~%")))))


