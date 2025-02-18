;;; 簡単なLispマクロ

(defmacro let1 (var val &body body)
  `(let ((,var ,val))
     ,@body))

(macroexpand '(let1 foo (+ 2 3)
               (* foo foo)))

;;; もっと複雑なマクロ

;; このmy-lengthを、マクロで見やすくしてみよう
(defun my-length (lst)
  (labels ((f (lst acc)
             (if lst
                 (f (cdr lst) (1+ acc)))))
    (f lst 0)))

;; 注意！ バグあり！
(defmacro split (val yes no)
  `(if ,val
       (let ((head (car ,val))
             (tail (cdr ,val)))
         ,yes)
       ,no))

;; ちょっと綺麗になったmy-length
(defun my-length (lst)
  (labels ((f (lst acc)
             (split lst
                    (f tail (1+ acc))
                    acc)))
    (f lst 0)))

;; splitのバグ
(macroexpand '(split (progn (princ "Lisp rocks!")
                            '(2 3))
               (format t "This can be split into ~a and ~a." head tail)
               (format t "This cannot be split.")))

;; バグを解消したsplit
;; 注意！ これにもまだバグがある！
(defmacro split (val yes no)
  `(let1 x ,val
     (if x
         (let ((head (car x))
               (tail (cdr x)))
           ,yes)
         ,no)))
