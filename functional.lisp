;;; 関数型プログラミング
;; 綺麗な、関数型の部分
(defun add-widget (database widget)
  (cons widget database))

;; 汚い、非関数型部分
(defparameter *database* nil)

(defun main-loop ()
  (loop (princ "Please enter the name of a new widget:")
        (setf *database* (add-widget *database* (read)))
        (format t "The database contains the following: ~a~%" *database*)))

;;; 高階関数で書こう
;; 命令型
(defparameter *my-list* '(4 7 2 3))
(loop for n below (length *my-list*)
      do (setf (nth n *my-list*) (+ (nth n *my-list*) 2)))
;; 関数型
(defun add-two (list)
  (when list
    (cons (+ 2 (car list))(add-two (cdr list)))))
;; 高階関数
(mapcar (lambda (x) (+ x 2)) '(4 7 2 3))
