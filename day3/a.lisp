(ql:quickload :april)
(ql:quickload :cl-ppcre)
(in-package :april)

(setf *i* (with-open-file (s "./day3/input.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

; get the input into april
(april (with (:state :in 
              ((i (coerce *i* 
                          'vector)))) )
       "input←i")

; part 1
(april "mat←(⊃⍴input) (⊃⍴input[1]) ⍴ '#'=∊input") 
; trees are now 1s and non-trees are 0
(april "pairs←{1 3+⍣⍵⊢1 1}¨¯1+⍳323")
(april "goodpairs←{⍵[1],(1+31|(⍵[2]-1))}¨pairs") ; the +1 -1 game because i can't get ⎕IO←0
                                                 ; and i need to do modulus with 0 based indexing
;       goodpairs ("good ordered pairs") have been wrapped in x since the map is stacked side by side ad infinitum
(april "+/goodpairs {⍺⌷⍵}¨ ⊂mat") ; 276
