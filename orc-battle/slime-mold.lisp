;;;; slime-moldの定義
(defstruct 
    (slime-mold 
        (:include monster))
    (sliminess 
        (randval 5)))
(push #'make-slime-mold *monster-builders*)

(defmethod monster-show 
    (
        (m slime-mold))
    (princ "A slime mold with a sliminess of ")
    (princ 
        (slime-mold-sliminess m)))

(defmethod monster-attack 
    (
        (m slime-mold))
    (let 
        (
            (x 
                (randval 
                    (slime-mold-sliminess m))))
        (princ "A slime mold wraps around your legs and decreases your agility by ")
        (princ x)
        (princ "!! ")
        (decf *player-agility* x)
        (when 
            (zerop 
                (random 2))
            (princ "It also squirts in your face, taking away a health point! ")
            (decf *player-health*))
))
