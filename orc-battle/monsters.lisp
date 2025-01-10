(load "monster.lisp")

;;; monsters
(defun init-monsters 
    ()
    (setf *monsters*
        (map 'vector 
            (lambda 
                (x)
                (funcall 
                    (nth 
                        (random 
                            (length *monster-builders*)) *monster-builders*)))
            (make-array *monster-num*))))

(defun monsters-dead 
    ()
    (every #'monster-dead *monsters*))

(defun show-monsters 
    ()
    (terpri)
    (princ "Your foes:")
    (let 
        (
            (x 0))
        (map 'list
            (lambda 
                (m)
                (terpri)
                (princ "   ")
                (princ 
                    (incf x))
                (princ ". ")
                (if 
                    (monster-dead m)
                    (princ "dead")
                    (progn
                        (princ "(Health=")
                        (princ 
                            (monster-health m))
                        (princ ") ")
                        (monster-show m))))
*monsters*)))

(defun random-monster 
    () 
    (let 
        (
            (m 
                (aref *monsters* 
                    (random 
                        (length *monsters*)))))
        (if 
            (monster-dead m)
            (random-monster)m)))

(defun pick-monster 
    ()
    (terpri)
    (princ "Monster #:")
    (let 
        (
            (x 
                (read)))
        (if 
            (not 
                (and 
                    (integerp x) 
                    (>= x 1) 
                    (<= x *monster-num*)))
            (progn 
                (princ "That is not a valid monster number.")
                (pick-monster))
            (let 
                (
                    (m 
                        (aref *monsters* 
                            (1- x))))
                (if 
                    (monster-dead m)
                    (progn 
                        (princ "That monster is already dead.")
                        (pick-monster))
m)))))
