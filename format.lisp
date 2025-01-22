;;; フォーマット関数

;; t で標準出力 nil で 文字列を返す
(format t "Add onion rings for only ~$ dollars more!" 1.5)

;; ~s で ダブルクォートつき。~a で見やすく表示
;; ~5aなどとして数字を入れると、「単語そのものを含めて数字分の長さになるように、空白が補われる」
(format t "I am printing ~s ~5a in the middle of this sentence." "foo" "bar")
;; I am printing "foo" bar   in the middle of this sentence.
;; NIL

;; 整数の表示
(format t "The number 10000 in hexadecimal is ~x" 1000)
The number 10000 in hexadecimal is 3E8
;; NIL

;; terpri 必ず改行する
;; format関数では、~%に相当。
(progn (princ 22)(terpri)(princ 33))
;; 23
;; 33
;; 33
;; fresh-line 必要なら、改行する
;; format関数では、~&に相当。
(progn (princ 22)(fresh-line)(fresh-line)(princ 33))
;; 23
;; 33
;; 33

;; テキストを揃える
(defun random-animal ()
  (nth (random 5) '("dog" "tick" "tiger" "walrus" "kangaroo")))

(loop repeat 10
      do (format t "~5t~a ~15t~a ~25t~a~%"
                 (random-animal)
                 (random-animal)
                 (random-animal)))

;; formatでLoop (????)
(defparameter *animals* (loop repeat 10 collect (random-animal)))
(format t "~{I see a ~a! ~}" *animals*)
