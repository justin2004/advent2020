(declaim (optimize (speed 0) (safety 3) (debug 3)))
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day10/input.txt" 
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
