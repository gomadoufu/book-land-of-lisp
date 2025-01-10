;; より進んだデータ構造と、ジェネリックプログラミング


;; 配列 効率の良いリスト;;
(make-array 3)

; get
(defparameter x 
    (make-array 3))
(aref x 1)

; set
(setf 
    (aref x 1) 'foo)
; set は 「ジェネリック」で、異なるデータ構造のgetterに対して同じように使える
(defparameter foo 
    (list 'a 'b 'c))
(setf 
    (second foo) 'z) ; (second foo) が getter. fooが変更された


;; ハッシュテーブル 効率の良いalist;;
(make-hash-table)

; getter
(defparameter x (make-hash-table))
(gethash 'yup x)


;; 複数の値を返す ;;
(defun foo () (values 3 7))
;; 複数の結果を受け取る ;;
(multiple-value-bind (a b) (foo) (* a b))


;; 構造体 ;;
; 宣言
; メンバのことは、Lispではスロットという
(defstruct person
           name
           age
           favorite-colour)
; 利用
(defparameter *bob* (make-person :name "Bob"
                                 :age 35
                                 :favorite-colour "blue"))
; getter
(person-age *bob*)
; setter
(setf (person-age *bob*) 36)

;; くにまたくん
(defparameter *ややまλ* (make-person :name "kunikuni"
                                    :age 23
                                    :favorite-colour "magenta"))
;; gomadoufu
(defparameter *goma-doufu* (make-person :name "gomadoufu"
                           :age 24
                           :favorite-colour "purpls")) 



(defun kunikuni-birthday (day) 
(when ()
    (princ "おめでとう〜")))

(let (kunikuni-age (person-age *ややまλ*))((princ kunikuni-age)(setf kunikuni-age (+ kunikuni-age 1))))

;;; シーケンス関数
;; length
(length '(a b c))
(length "blub")
(length (make-array 5))
;; 色々
(find-if #'numberp '(a b 5 d))
(count #\s "mississippi")
(position #\4 "2kewl4skewl")
(some #'numberp '(a b 5 d))
(every #'numberp '(a b 5 d))
;; 便利なreduce
(reduce #'+ '(3 4 6 5 2))
(defun sum (lst) (reduce #'+ lst))
;; map 汎用のmapcar。第一引数は返り値の型
(map 'list (lambda (x)
                (if (eq x #\s)
                    #\S
                    x))
            "this is a string")
;; シーケンスの一部を取り出す subseq
(subseq "america" 2 6) ; → "eric"
;; ソート
(sort '(5 8 2 4 9 3 6) #'<) 

; 数値かどうか調べる
(numberp 5)
; 他にも、arrayp, characterp, consp, functionp, hash-table-p listp, stringp, symbolp

;; 型による(たぶん動的)ディスパッチ
; (defmethod ((引数名1 型1)(引数名2 型2)..)(本体))
(defmethod add ((a number)(b number))
    (+ a b))
(defmethod add ((a list)(b list))
    (append a b))
