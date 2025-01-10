;; プレイヤーの状態
(defparameter *player-health* nil)
(defparameter *player-agility* nil) ; 1ラウンドで何回攻撃できるか
(defparameter *player-strength* nil)

;; モンスターの情報を保持する配列
(defparameter *monsters* nil)
;; モンスターを作成する関数のリスト
(defparameter *monster-builders* nil)
;; 騎士が戦うモンスターの数 = 難易度
(defparameter *monster-num* 12)

;; 補助関数
(defun randval 
    (n) 
    (1+ 
        (random 
            (max 1 n))))
