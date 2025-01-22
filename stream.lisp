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
