;;;; orcの定義
(defstruct 
    (orc 
        (:include monster))
    (club-level 
        (randval 8)))
(push #'make-orc *monster-builders*)

(defmethod monster-show 
    (
        (m orc))
    (princ "A wicked orc with a level ")
    (princ 
        (orc-club-level m))
    (princ " club")
)

(defmethod monster-attack 
    (
        (m orc))
    (let 
        (
            (x 
                (randval 
                    (orc-club-level m))))
        (princ "An orc swings his club at you and knocks off ")
        (princ x)
        (princ " of your health points. ")
        (decf *player-health* x)))
