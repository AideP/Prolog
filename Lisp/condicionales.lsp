(defun cond-menu ()
  (format t "Selecciona la condicion:~%")
  (format t "1. condicion-si~%")
  (format t "2. when~%")
  (format t "3. unless~%"))

(defun leer-opcion ()
  (format t "Elige una opcion (1-3): ")
  (read))

(defun condicion-si ()
  (format t "~%Introduce tu edad: ")
  (let ((edad (read)))
    (if (> edad 18)
        (format t "Es mayor de edad.~%")
        (format t "Es menor de edad.~%"))))

(defun es-mayor ()
  (cond-menu) ;; Mostrar el menú
  (let ((opcion (leer-opcion)))
    (cond
      ((= opcion 1) (condicion-si)) ;; Ejecutar condicion-si
      ((= opcion 2) (format t "Opción 'when' no implementada aún.~%"))
      ((= opcion 3) (format t "Opción 'unless' no implementada aún.~%"))
      (t (format t "Opción inválida.~%")))))
