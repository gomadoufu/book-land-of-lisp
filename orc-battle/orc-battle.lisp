(load "init.lisp")
(load "monsters.lisp")
(load "player.lisp")

;;; monster list ;;;
(load "orc.lisp")
(load "hydra.lisp")
(load "slime-mold.lisp")
(load "brigand.lisp")
;;;              ;;;

(defun game-loop 
    ()
    (unless 
        (or 
            (player-dead) 
            (monsters-dead))
        (show-player)
        (dotimes 
            (k 
                (1+ 
                    (truncate 
                        (/ 
                            (max 0 *player-agility*) 15))))
            (unless 
                (monsters-dead)
                (show-monsters)
                (player-attack)))
        (terpri)
        (map 'list
            (lambda 
                (m)
                (or 
                    (monster-dead m) 
                    (monster-attack m)))
*monsters*)
        (game-loop)))

(defun orc-battle 
    ()
    (init-monsters)
    (init-player)
    (game-loop)
    (when 
        (player-dead)
        (princ "You have been killed. Game Over."))
    (when 
        (monsters-dead)
        (princ "Congratulations! You have vanquished all of your foes.")))
