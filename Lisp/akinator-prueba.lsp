(defparameter *nodes* 
  '((Los-juegos-del-hambre (
      ("Katniss Everdeen" 
       ("Distrito 12" 
        ("Atributos" 
         ("Habilidad" ("Arco y flecha"))
         ("Estado" ("Viva"))
         ("Rol" ("Protagonista principal")))
        ("Historia" 
         ("Participación en los Juegos" ("74° Juegos del Hambre" "Vencedora")))
         ("Aliados" ("Peeta Mellark" "Rue" "Haymitch Abernathy")))))
      ("Peeta Mellark" 
       ("Distrito 12" 
        ("Atributos"
         ("Habilidad" ("Camuflaje"))
         ("Estado" ("Vivo"))
         ("Rol" ("Interés amoroso de Katniss")))
        ("Historia"
         ("Participación en los Juegos" ("74° Juegos del Hambre" "Vencedor"))
         ("Aliados" ("Katniss Everdeen" "Haymitch Abernathy")))))
      ))
    (En-llamas (
      ("Finnick Odair" 
       ("Distrito 4"
        ("Atributos" 
         ("Habilidad" ("Lucha con tridente"))
         ("Estado" ("Muerto"))
         ("Rol" ("Aliado de Katniss y Peeta")))
        ("Historia"
         ("Participación en los Juegos" ("65° Juegos del Hambre" "Vencedor"))
         ("Aliados" ("Katniss Everdeen" "Peeta Mellark" "Mags")))))
      ("Johanna Mason"
       ("Distrito 7"
        ("Atributos"
         ("Habilidad" ("Sigilo"))
         ("Estado" ("Viva"))
         ("Rol" ("Tributo del Distrito 7")))
        ("Historia"
         ("Participación en los Juegos" ("71° Juegos del Hambre" "Vencedora"))
         ("Aliados" ("Beetee Latier" "Katniss Everdeen")))))
      ))
    (Sinsajo (
      ("Katniss Everdeen"
       ("Distrito 13"
        ("Atributos"
         ("Habilidad" ("Liderazgo"))
         ("Estado" ("Viva"))
         ("Rol" ("El símbolo de la rebelión")))
        ("Historia"
         ("Participación en los Juegos" ("74° y 75° Juegos del Hambre"))
         ("Aliados" ("Peeta Mellark" "Gale Hawthorne" "Boggs")))))
      ("Primrose Everdeen"
       ("Distrito 13"
        ("Atributos"
         ("Habilidad" ("Medicina"))
         ("Estado" ("Muerta"))
         ("Rol" ("Hermana menor de Katniss")))
        ("Historia"
         ("Contribuciones" ("Cuidados médicos en la rebelión"))
         ("Aliados" ("Katniss Everdeen" "Gale Hawthorne")))))
      ))
    (Balada-de-pájaros-cantores-y-serpientes (
      ("Coriolanus Snow"
       ("Capitolio"
        ("Atributos"
         ("Habilidad" ("Manipulación"))
         ("Estado" ("Vivo"))
         ("Rol" ("Futuro presidente de Panem")))
        ("Historia"
         ("Participación" ("Mentor en los 10° Juegos del Hambre"))
         ("Aliados" ("Lucy Gray Baird" "Sejanus Plinth")))))
      ("Lucy Gray Baird"
       ("Distrito 12"
        ("Atributos"
         ("Habilidad" ("Canto"))
         ("Estado" ("Desconocido"))
         ("Rol" ("Tributo carismática del Distrito 12")))
        ("Historia"
         ("Participación en los Juegos" ("10° Juegos del Hambre"))
         ("Aliados" ("Coriolanus Snow")))))
      ))
    (Otros (
      ("Effie Trinket"
       ("Capitolio"
        ("Atributos"
         ("Habilidad" ("Etiqueta y protocolo"))
         ("Estado" ("Viva"))
         ("Rol" ("Chaperona de los tributos del Distrito 12")))
        ("Historia"
         ("Contribuciones" ("Organización de ceremonias"))
         ("Aliados" ("Katniss Everdeen" "Peeta Mellark")))))
      ("Rue"
       ("Distrito 11"
        ("Atributos"
         ("Habilidad" ("Agilidad y sigilo"))
         ("Estado" ("Muerta"))
         ("Rol" ("Aliada joven de Katniss")))
        ("Historia"
         ("Participación en los Juegos" ("74° Juegos del Hambre"))
         ("Aliados" ("Katniss Everdeen")))))
      ))
    ))

(defun recorrer-principales (nodo)
  "Recorre los libros principales dentro de la estructura y permite entrar a detalles."
  (dolist (libro nodo)
    (let ((titulo (car libro))
          (personajes (cadr libro)))
      (format t "~%Libro: ~A~%" titulo) ;; Muestra el título del libro
      (recorrer-personajes personajes)))) ;; Llama a una función auxiliar para recorrer personajes

(defun recorrer-personajes (personajes)
  "Recorre los personajes dentro de un libro."
  (dolist (personaje personajes)
    (let ((nombre (car personaje))
          (detalles (cadr personaje)))
      (format t "~%  Personaje: ~A~%" nombre) ;; Muestra el nombre del personaje
      (recorrer-detalles detalles)))) ;; Llama a una función auxiliar para recorrer detalles

(defun recorrer-detalles (detalles)
  "Recorre los detalles de un personaje."
  (dolist (detalle detalles)
    (let ((categoria (car detalle))
          (contenido (cadr detalle)))
      (format t "~%    ~A: ~A" categoria contenido)))) ;; Muestra los detalles del personaje

;; Llama a la función principal para recorrer los nodos
(recorrer-principales *nodes*)


; modificar la función para ir haciendo preguntas y recibir los datos dados por el usuario (Y/N)

