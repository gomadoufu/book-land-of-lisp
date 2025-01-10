(defstruct 
    (hydra 
        (:include monster)))
(push #'make-hydra *monster-builders*)

(defmethod monster-show 
    (
        (m hydra))
    (princ "A malicious hydra with ")
    (princ 
        (monster-health m))
    (princ " heads."))

(defmethod monster-hit 
    (
        (m hydra) x)
    (decf 
        (monster-health m) x)
    (if 
        (monster-dead m)
        (princ "The corpse of the fully decapitated and decapacitated hydra falls to the floor!")
        (progn
            (princ "You lop off ")
            (princ x)
            (princ " of the hydra's heads! "))))

(defmethod monster-attack 
    (
        (m hydra))
    (let 
        (
            (x 
                (randval 
                    (ash 
                        (monster-health m) -1))))
        (princ "A hydra attacks you with ")
        (princ x)
        (princ " of its heads! It also grows back one more head! ")
        (incf 
            (monster-health m))
        (decf *player-health* x)))
