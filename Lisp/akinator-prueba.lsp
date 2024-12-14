(defparameter juegos-nodes '(
    (Distrito12 (
        (Cazadores (Katniss Everdeen))
        (Panaderos (Peeta Mellark))
        (Mineros (Gale Hawthorne))
    ))
    (Distrito11 (
        (Recolectores (Rue))
        (Granjeros (Thresh))
    ))
    (Distrito1 (
        (TributosProfesionales (Glimmer))
        (Guerreros (Cato))
    ))
    (Distrito2 (
        (TributosProfesionales (Clove))
        (Entrenadores (Brutus))
    ))
    (Capitolio (
        (Presidentes (Coriolanus Snow))
        (Estilistas (Effie Trinket))
    ))
))

(defun recorre-juegos (lista &optional (nivel 0))
  (when lista
    (let ((elemento (car lista)))
      (cond
        ((= nivel 0)
         (format t "¿Pertenece a este Distrito: ~a?~%" (car elemento)))
        ((= nivel 1)
         (format t "¿Es este un rol del Distrito: ~a?~%" (car (car elemento))))
        (t
         (format t "¿Es este el personaje: ~a?~%" (car (cdr elemento)))))

     
      (setq a (read))
      (if (string-equal a "si")
          (let ((b (cdr elemento)))
            (cond
              ((and (listp b) (listp (car b)))
               (recorre-juegos b (1+ nivel)))
              ((listp b)
               (format t "¡Encontrado! Tu personaje es: ~a~%" (car b)))
              ;; Caso base para evitar un ciclo
              (t
               (format t "¡Finalizado!"))))
          (recorre-juegos (cdr lista) nivel))))) 

