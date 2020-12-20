(declaim (optimize (speed 0) (safety 3) (debug 3)))
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day9/input.txt" 
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
(april "ps←25") ; preamble size
(april "windows←(ps+1)-⍨⍴a")
(april "vs←(-(ps+1))↑¨((ps+1)+⍳windows)∘.↑⊂a")
(april "issum←{(¯1↑⍵),(¯1↑⍵)∊(∘.+⍨ps↑⍵)}¨vs") ; selfie
(april "sum←⊃⊃(issum/⍨{0=⍵[2]}¨issum)")

; part 2
(april "b←((⍳⍴a)-1)↓¨⊂a ⋄ 0")
; (april "c←((⍳⍴a)-1)∘.↑b ⋄ 0") ; this 1000 by 1000 mat used too much mem

; ran out of memory making a 1000 by 1000 mat.
; so i had to do 100 by 1000 mats one at a time
; by changing 0 to 100 then 200, etc.
(april "c←(0+⍳100)∘.↑b ⋄ 0")
(april "d←(,c),¨[0.5](¨+/¨,c) ⋄ 0") ; seq first then sum
(april "res←{(sum=¯1↑⍵)∧({(1↑⍵)+¯1↑⍵}¯1↓(⊂∘⍋⌷⊢)⍵)}¨d ⋄ 0")
(april "res/⍨0≠⊃¨res") ;    p2 54142584

