(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day5/input.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

; get the input into april
(april (with (:state :in 
              ((i (apl-format-array (coerce  *i*
                           'vector))))) )
       "input←i")
(april (with (:state :in 
              ((i (coerce  *i*
                           'vector)))) )
       "input←i")

; part 1 prep
(april "⍴input[1]")

(april-f (with (:state :unformat-output nil)) "2 2⍴⊂2 2⍴⍳4")
(apl-format-array (coerce  *i*
                           'vector))
(type-of *i*)

; BFFFBBFRRR: row 70, column 7, seat ID 567.
(april "2⊥1 0 0 0 1 1 0")
(april "2⊥1 1 1")

(april "input")
(april "i←↑3⍴⊂'BFFFBBFRRR'")
(april-f "i1←('R'=i) ∨'B'=i")
(april-f "i")
(april "2(⊥⍤1) i1")
; Mv (f⍤1)Nm         Apply f between vector Mv and each row of Nm)
(april-f "('R'=↑input) ∨ 'B'=↑input")
(april "ids←2(⊥⍤1) ('R'=↑input) ∨ 'B'=↑input")
(april "¯1↑ids[⍋ids]")
(april "¯1↑ids[⍋ids←2(⊥⍤1) ('R'=↑input) ∨ 'B'=↑input]")


(april "'BR'=↑input")
(april "'BRLRRL'='B'")
(april "(=∘'B') 'BRRLLB'")
(april ",/2⍴'BRRLLB'")
(april "'BR'=2⍴⊂'BRRLLB'")
(april "2⍴⊂'BRRLLB'")
(april "2⍴⊂¨input")

(april "(2⍴⊂)¨i")
(april "'B'=(2⍴⊂)¨i")

(april "(2⍴⊂)¨'BRRLLB' 'RBBBLB' 'RAMBLAC'")
(april "a←(2⍴⊂)¨'BRRLLB' 'RBBBLB' 'RAMBLAC'")
(april "'B'=¨a")

(april "'BA'=2⍴⊂'RAMBLAC'")

; f ← (32∘+)∘(×∘1.8)  )
