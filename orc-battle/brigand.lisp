(defstruct 
    (brigand 
        (:include monster)))
(push #'make-brigand *monster-builders*)

(defmethod monster-attack 
    (
        (m brigand))
    (let 
        (
            (x 
                (max *player-health* *player-agility* *player-strength*)))
        (cond 
            (
                (= x *player-health*)
                (princ "A brigand hits you with his slingshot, taking off 2 health points! ")
                (decf *player-health* 2))
            (
                (= x *player-agility*)
                (princ "A brigand catches your leg with his whip, taking off 2 agility points! ")
                (decf *player-agility* 2))
            (
                (= x *player-strength*)
                (princ "A brigand cuts your arm with his whip, taking off 2 strength points! ")
                (decf *player-strength* 2)))))
