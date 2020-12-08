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

; part 1
(april "ids←2(⊥⍤1) ('R'=↑input) ∨ 'B'=↑input ⋄ ¯1↑ids[⍋ids]") ; works in april
; (april "¯1↑ids[⍋ids←2(⊥⍤1) ('R'=↑input) ∨ 'B'=↑input]") ; works in dyalog
;       this should work in april after https://github.com/phantomics/april/issues/92


; part 2
(april "passes←ids[⍋ids]") 
(april "1↑¯1+(passes - 83+⍳⍴passes)/passes")
; (april "(1⌽passes - 83+⍳⍴passes)/passes") ; needed this to look at the missing pass

