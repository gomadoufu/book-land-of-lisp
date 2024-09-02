;; ifコマンド
;; (if 条件リスト リストA リストB) 
;; 条件リストが空でなければ リストA でなければ リストB
;; 空リストは偽
(if '
    () 'i-am-true 'i-am-false)

(if '
    (1) 'i-am-true 'i-am-false)

;; リストの長さを計算する
(defun my-length 
    (list)
    (if list 
        (1+ 
            (my-length 
                (cdr list)))
0))

(my-length '
    (list with four symbols))

;; when
;; 条件が真の時に、囲まれた式をすべて実行
(defvar *number-is-odd* nil)
(when 
    (oddp 5) 
    (setf *number-is-odd* t) 
    'odd-number)

;; unless
;; 条件が偽の時に、囲まれた式をすべて実行
(unless 
    (oddp 4) 
    (setf *number-is-odd* nil)
    'even-number)

;; cond
;; 複数の文が書けるし、複数の分岐が書ける
(defvar *arch-enemy* nil)
(defun pudding-eater 
    (person)
    (cond 
        (
            (eq person 'henry) 
            (setf *arch-enemy* 'stupid-lisp-alien) '
            (curse you lisp alien - you ate my pudding))
        (
            (eq person 'johnny)
            (setf *arch-enemy* 'useless-old-johnny) '
            (i hope you choked on my pudding johnny))

        (t '
            (why you eat my pudding stranger ?))))

;; case
;; こっちの方が書きやすい
(defun pudding-eater 
    (person)
    (case person
        (
            (henry) 
            (setf *arch-enemy* 'stupid-lisp-alien) '
            (curse you lisp alien - you ate my pudding))
        (
            (johnny)
            (setf *arch-enemy* 'useless-old-johnny) '
            (i hope you choked on my pudding johnny))

        (otherwise '
            (why you eat my pudding stranger ?))))

;; 挨拶関数
(defun greeting 
    (name) 
    (case name 
        (
            (gomadoufu)
            (princ 
                (list name "おはよう！")))
        (
            (kunimata-kun)
            (princ 
                (list name "おやすみ〜")))
        (otherwise 
            (princ 
                (list name "さんっていうんですね。")))))

;; and と or
;; 短絡評価
(and (oddp 5) (oddp 7) (oddp 9))
;; -> T
(or (oddp 5) (oddp 4) (oddp 2)) 
;; -> T

;; 真理以上のものを返す関数
(if (member 1 '(3 4 1 5))
    'one-is-in-the-list
    'one-is-not-in-the-list) ;; -> T
(member 1 '(3 4 1 5)) ;; -> (1, 5)
;; Tだけとかでもいいはずなのに、たくさん返してくれてて嬉しい

;; 比較
;; 1. シンボル(クォートがついた文字列)同士は、常にeqで比較すべし
;; 2. シンボル同士の比較でなければ、(数値とか文字列には)equalを使え
