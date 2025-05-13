(defun relative->absolute (filename)
  (let ((cd "/Users/gomadoufu/ghq/github.com/gomadoufu/book-land-of-lisp/"))
    (if (string= (subseq filename 0 1) "/")
        filename
        (concatenate 'string cd filename))))

(load (relative->absolute "the-house-of-the-wizard.lisp"))
(load (relative->absolute "input-output.lisp"))

;; 溶接のコマンド
(defun have (object)
  (member object (cdr (inventory))))

(defparameter *chain-welded* nil)

(defun weld (subject object)
  (if (and (eq *location* 'attic)
           (eq subject 'chain)
           (eq object 'bucket)
           (have 'chain)
           (have 'bucket)
           (not *chain-welded*))
      (progn (setf *chain-welded* t)
             '(the chain is now securely welded to the bucket.))
      '(you cannot weld like that.)))

(pushnew 'weld *allowed-commands*)

;; 投げ入れるコマンド
(defparameter *bucket-filled* nil)

(defun dunk (subject object)
  (if (and (eq *location* 'garden)
           (eq subject 'chain)
           (eq object 'well)
           (have 'bucket)
           *chain-welded*)
      (progn (setf *bucket-filled* t)
             '(the bucket is now full of water))
      '(you cannot dunk like that.)))

(pushnew 'dunk *allowed-commands*)
