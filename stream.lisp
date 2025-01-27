;;;; ストリーム


;;; 出力ストリーム
;; 出力ストリームかどうかを調べる
(output-stream-p *standard-output*)
;; 1文字出力
(write-char #\x *standard-output*)

;;; 入力ストリーム
(input-stream-p *standard-input*)
(read-char *standard-input*)

;;; ファイルの読み書き
(with-open-file (my-stream "data.txt" :direction :output)
  (print "my data" my-stream))
(with-open-file (my-stream "data.txt" :direction :input)
  (read my-stream))

;; 読み書き
(let ((animal-noises '((dog . woof)
                       (cat . meow))))
  (with-open-file (my-stream "animal-noises.text" :direction :output :if-exists :error)
    (print animal-noises my-stream)))
(with-open-file (my-stream "animal-noises.txt" :direction :input)
  (read my-stream))


;;; ソケットプログラミング！

(ql:quickload "usocket")
(defun create-server (port)
  (let* ((socket (usocket:socket-listen "127.0.0.1" port)) ; 引数のIPとportを結合してsocket objectを返す
         (connection (usocket:socket-accept socket :element-type 'character))) ; 接続が確立されたときにだけ値を返す 
    (unwind-protect 
         (progn
           (format (usocket:socket-stream connection) "Hello World~%")
           (force-output (usocket:socket-stream connection)))
      (progn
        (format t "Closing sockets~%")
        (usocket:socket-close connection)
        (usocket:socket-close socket)))))

(defun create-client (port)
  (let ((socket (usocket:socket-connect "127.0.0.1" port :element-type 'character)))
    (unwind-protect 
         (progn
           (usocket:wait-for-input socket)
           (format t "~A~%" (read-line (usocket:socket-stream socket))))
      (usocket:socket-close socket))))

;;; 文字列ストリーム
;; ストリームに文字列を送ることができる。デバッグとかに便利
(defparameter foo (make-string-output-stream))
(princ "This will go into foo." foo)
(princ "This will also go into foo." foo)
(get-output-stream-string foo)

(with-output-to-string (*standard-output*)
  (princ "the sum of ")
  (princ 5)
  (princ " and ")
  (princ 2)
  (princ " is ")
  (princ (+ 2 5)))
