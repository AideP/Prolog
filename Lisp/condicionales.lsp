(defun mostrar-menu ()
  (format t "Selecciona la condicion:~%")
  (format t "1. condicion-si~%")
  (format t "2. when~%")
  (format t "3. unless~%"))

(defun leer-opcion ()
  (format t "Elige una opcion (1-3): ")
  (read))

(defun condicion-si ()
  (format t "Introduce tu edad: ")
  (let ((edad (read)))
  (if (> (edad) 18)
    (print "Es mayor de edad")
    (print "Es menor"))
    ))

(defun es-mayor ()
  (mostrar-menu)
  (let ((opcion (leer-opcion)))
    (cond
      ((= opcion 1) (condicion-si))

      (t (format t "Opcion invalida.~%")))))
