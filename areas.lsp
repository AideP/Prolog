(defun mostrar-menu ()
  (format t "Selecciona una figura geométrica:~%")
  (format t "1. Cuadrado~%")
  (format t "2. Rectangulo~%")
  (format t "3. Triangulo~%")
  (format t "4. Circulo~%")
  (format t "5. Pentagono~%")
  (format t "6. Hexágono~%")
  (format t "7. Trapecio~%")
  (format t "8. Elipse~%")
  (format t "9. Paralelogramo~%")
  (format t "10. Rombo~%"))

(defun leer-opcion ()
  (format t "Elige una opcion (1-10): ")
  (read))

(defun cuadrado ()
  (format t "Introduce la longitud del lado del cuadrado: ")
  (let ((lado (read)))
    (let ((area (* lado lado))
          (perimetro (* 4 lado)))
      (format t "Area del cuadrado: ~a~%" area)
      (format t "Perimetro del cuadrado: ~a~%" perimetro))))

(defun calcular-area-perimetro ()
  (mostrar-menu)
  (let ((opcion (leer-opcion)))
    (cond
      ((= opcion 1) (cuadrado))

      (t (format t "Opcion invalida.~%")))))


