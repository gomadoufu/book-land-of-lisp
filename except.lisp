;;; その前にちょっと例外処理のお勉強
;; ユーザ定義の例外を作る
(define-condition foo () ()
  (:report (lambda (condition stream)
             (princ "Stop FOOing around, numbskull!" stream))))

(defun bad-function ()
  (error 'foo))

;; 例外のキャッチ
(handler-case (bad-function)
  (foo () "somebody signaled foo!")
  (bar () "somebody signaled bar!"))

;; finally節のやつ
(unwind-protect (/ 1 0)
  (princ "絶対実行される"))
