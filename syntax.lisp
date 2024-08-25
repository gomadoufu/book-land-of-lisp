;; 文字列を表示する
(princ "Tutti Frutti")

;; フォーム ... Lispの実行単位 ... 最初がコマンドのリスト
(expt 2 3) ; -> 8
;; データ ... 頭にシングルクォートがついているフォーム
'; <- クォートしている
(expt 2 3) ; -> (EXPT 2 3)

;; コンスという構造がある
;; 表現: (A . B)
;; cons関数
(cons 'chicken 'cat) ; -> (CHICKEN . CAT) これはリストじゃなくてコンスセル
(cons 'chicken nil)

;; car関数
(car '(pork beef chicken)) ; -> PORK
;; cdr関数
(cdr '(pork beef chicken)) ; -> (BEEF CHICKEN)

;; 末尾がnilのコンスがリスト
;; 表現: (A B)
;; '() = () = 'nil = nil
;; list関数
(list 'pork 'beef 'chicken) ; -> (PORK BEEF CHICKEN)
