; defparameterはグローバル変数定義
(defparameter *small* 1)
(defparameter *big* 100)

; letでローカル変数定義
(let 
    (gomadoufu 100))
(let 
    (
        (a 5) 
        (b 6)) 
    (+ a b))

; グローバル関数
(defun guess-my-number
    ()
    (ash 
        (+ *small* *big*) -1))

(defun smaller 
    () 
    (setf *big* 
        (1- 
            (guess-my-number)))
    (guess-my-number))

(defun bigger
    () 
    (setf *small* 
        (1+ 
            (guess-my-number)))
    (guess-my-number))

(defun start-over 
    ()
    (defparameter *small* 1)
    (defparameter *big* 100)
    (guess-my-number))


; ローカル関数
(flet 
    (
        (f 
            (n) 
            (+ n 10)))
    (f 5))

; ローカル関数の中で他のローカル関数を使うときはlabels
(labels 
    (
        (a 
            (n)
            (+ n 5))
        (b 
            (n) 
            (+ 
                (a n) 6))) 
    (b 10))

; コマンド let flet labels ... コマンド名 カッコ カッコ を先に書いちゃう
; 関数 ... (defun) 関数名 カッコ カッコ を先に書いちゃう
; 計算する式 + n 5とか ... 上記の限りではない
