(defparameter *nodes* '(
    (Los-juegos-del-hambre (
            ("Katniss Everdeen" ("Distrito 12" (
                                ("Atributos" (
                                    ("Habilidad" "Arco y flecha")
                                    ("Estado" "Viva")
                                    ("Rol" "Protagonista principal")
                                ))
                                ("Historia" (
                                    ("Participación en los Juegos" ("74 Juegos del Hambre" "Vencedora"))
                                ))
                                ("Aliados" ("Peeta Mellark" "Rue" "Haymitch Abernathy"))
            )))
            ("Peeta Mellark" ("Distrito 12" (
                                ("Atributos" (
                                    ("Habilidad" "Camuflaje")
                                    ("Estado" "Vivo")
                                    ("Rol" "Interés amoroso de Katniss")
                                ))
                                ("Historia" (
                                    ("Participación en los Juegos" ("74 Juegos del Hambre" "Vencedor"))
                                ))
                                ("Aliados" ("Katniss Everdeen" "Haymitch Abernathy"))
            )))
    ))
    (En-llamas (
            ("Finnick Odair" ("Distrito 4" (
                                ("Atributos" (
                                    ("Habilidad" "Lucha con tridente")
                                    ("Estado" "Muerto")
                                    ("Rol" "Aliado de Katniss y Peeta")
                                ))
                                ("Historia" (
                                    ("Participación en los Juegos" ("65 Juegos del Hambre" "Vencedor"))
                                ))
                                ("Aliados" ("Katniss Everdeen" "Peeta Mellark" "Mags"))
            )))
            ("Johanna Mason" ("Distrito 7" (
                                ("Atributos" (
                                    ("Habilidad" "Sigilo")
                                    ("Estado" "Viva")
                                    ("Rol" "Tributo del Distrito 7")
                                ))
                                ("Historia" (
                                    ("Participación en los Juegos" ("71 Juegos del Hambre" "Vencedora"))
                                ))
                                ("Aliados" ("Beetee Latier" "Katniss Everdeen"))
            )))
    ))
    ;; Otros nodos omitidos por brevedad.
))

(defun recorrer-nodos (nodos)
  "Recorre todos los libros principales en los nodos."
  (dolist (libro nodos)
    (let ((titulo (car libro))
          (personajes (cadr libro)))
      (format t "~%Libro: ~A~%" titulo)
      (recorrer-personajes personajes))))

(defun recorrer-personajes (personajes)
  "Recorre todos los personajes de un libro."
  (dolist (personaje personajes)
    (let ((nombre (car personaje))
          (detalles (cadr personaje)))
      (format t "  Personaje: ~A~%" nombre)
      (recorrer-detalles detalles))))

(defun recorrer-detalles (detalles)
  "Recorre los detalles de un personaje."
  (dolist (detalle detalles)
    (let ((categoria (car detalle))
          (contenido (cadr detalle)))
      (format t "    ~A: ~A~%" categoria contenido)
      (when (listp contenido) ; Si el contenido es una lista, lo recorremos.
        (recorrer-detalles contenido)))))

;; Llamada principal para iniciar el recorrido.
(recorrer-nodos *nodes*)
