;;;; generic monster
(defstruct monster 
    (health 
        (randval 10))) ; スロットを宣言するときにかっこの中に入れると、デフォルト値を設定できる

(defun monster-dead 
    (m)
    (<= 
        (monster-health m) 0))

(defmethod monster-show 
    (m) 
    (princ "A fierce ")
    (princ 
        (type-of m)))

(defmethod monster-hit 
    (m x)
    (decf ; decfは変数の中身を減らす
        (monster-health m) x)
    (if 
        (monster-dead m)
        (progn
            (princ "You killed the ")
            (princ 
                (type-of m)) ; type-ofで型名がわかる
            (princ "! "))
        (progn
            (princ "You hit the ")
            (princ 
                (type-of m))
            (princ ", knocking off ")
            (princ x)
            (princ " health points! "))))

(defmethod monster-attack 
    (m))
