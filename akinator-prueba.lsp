(defparameter *nodes* '((Los-juegos-del-hambre (
                            (katniss (arco y flecha))
                            (peeta (camuflaje))
                            (gale (caza))
                            (haymitch (estrategia))))
                        (En-llamas (
                            (finnick (lucha con tridente))
                            (johanna (sigilo))
                            (beetee (tecnología))
                            (wiress (inteligencia))))
                        (Sinsajo (
                            (katniss (liderazgo))
                            (peeta (diplomacia))
                            (gale (combatiente))
                            (prim (medicina))))
                        (Balada-de-pájaros-cantores-y-serpientes (
                            (corolianus (manipulación))
                            (lucy (canto))
                            (tigris (camuflaje))
                            (sejanus (idealismo))))))

(defun recorrer-principales (nodo)
  (dolist (libro nodo)
    (let ((titulo (car libro)))
      (format t "Libro: ~A~%" titulo)
            )))


(recorrer-principales *nodes*)

