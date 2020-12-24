(declaim (optimize (speed 0) (safety 3) (debug 3)))
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day10/input-sample.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))


; get the input into april
(april (with (:state :in 
              ((i (apl-format-array (coerce *i*
                                             'vector))))) )
       "input←i")



; part 1
(april "a←{⍎⍵}¨input")
(april "b←0,(⊂∘⍋⌷⊢)a")
(april "c←b,3+(⍴b)⌷b")
; (april "{⍺ ⍵}⌸(1⌽c)-c")
(april "ones←+/1=(1⌽c)-c")
(april "threes←+/3=(1⌽c)-c")
(april "ones×threes")


; part 2 is in dyalog  in "a.apl"
(april "c←b,3+(⍴b)⌷b")
(april "c")
(april "d←{⌿∘⍵¨↓⌽⍉2⊥⍣¯1⊢¯1+⍳2*≢⍵}c ⋄ 0")
(april "{⌿∘⍵¨↓⌽⍉2⊥⍣¯1⊢¯1+⍳2*≢⍵}'abc'")

(april "((⍴c)⍴1)/c")
(april "(⍴c)⍴1")
(april "(⍳⍴c) ∘.⌷c")
(april "1 2 3 ∘.⌷⊂c")
; 0 1 1 1   7 
; 1 0 1 1   11
; 1 1 0 1   13
; 1 1 1 0   14
; 1 1 1 1   15
(april "2⊥1 1 1 0")
(april "3⌷c")
(april-f "(⍳3)∘.,⍳3")

(april "⍴+.×⌿?2 30 30⍴10")
(april "+.×⌿?2 5 5⍴10")


(april "↓⍉1 2 3 4")
(april "↓1 2 3 4")
(april "↓5 2⍴8")
