; 対 pair
(cons 2 3) ; -> (2 . 3)

; 循環リスト
; #1=(1 2 3 . #1#)

; 連想リスト
(defparameter *drink-order* '((bill . double-espresso)(lisa . small-drip-coffee)(john . medium-latte)))
; look-up 先頭から検索
(assoc 'lisa *drink-order*)
; push 上書きはせず、すでにあるリストの前に新しい要素を追加する
(push '(lisa . large-mocha-with-whipped-cream) *drink-order*)

; graphvizのグラフを描くやつ

(defparameter *wizard-nodes* '
    (
        (living-room 
            (you are in the living-room. there is a wizard is snoring loudly on the couch.))
        (garden 
            (you are in a beautiful garden. there is a well in front of you.))
        (attic 
            (you are in the attic. there is a giant welding torch in the corner.))))


(defparameter *wizard-edges* '
    (
        (living-room 
            (garden west door)
            (attic upstairs ladder))
        (garden 
            (living-room east door))
        (attic 
            (living-room downstairs ladder))))
