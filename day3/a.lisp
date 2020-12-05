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
(april "pairs←{1 3+⍣⍵⊢1 1}¨¯1+⍳⊃⍴mat")
(april "goodpairs←{⍵[1],(1+(2⊃⍴mat)|(⍵[2]-1))}¨pairs") ; the +1 -1 game because i can't get ⎕IO←0
                                                 ; and i need to do modulus with 0 based indexing
;       goodpairs ("good ordered pairs") have been wrapped in x since the map is stacked side by side ad infinitum
(april "+/goodpairs {⍺⌷⍵}¨ ⊂mat") ; 276



; part 2
(april "pairs←{1 3+⍣⍵⊢1 1}¨¯1+⍳323")
(april "slopes←5 2 ⍴ 1 1 3 1 5 1 7 1 1 2")
(april "pairs←(2 2){⍺[1] ⍺[2]+⍣⍵⊢1 1}¨¯1+⍳323")
(april "(2 2){⍺[1] ⍺[2]+⍣⍵⊢1 1} 3")
(april "slopes {⍺[1] ⍺[2]+⍣⍵⊢1 1} 2")

(april-f "slopes+[2] 1 2")

(april-f "slopes")
(april "pairs←{(slopes+[2])⍣⍵⊢5 2 ⍴ 1 1}¨¯1+⍳323")
(april "pairs←{(slopes+[2])⍣⍵⊢5 2 ⍴ 1 1}¨⍳4")
(april "pairs←{((5 2 ⍴ 1 1)+[2])⍣⍵⊢slopes}¨¯1+⍳323") ; maybe
(april "⍴pairs")
(april "((5 2 ⍴ 1 1)+[2])⍣1⊢slopes")

(april "slopes+[2]⍣4⊢2 2")
(april "(slopes+[2] 2 2)+[2] 2 2")
(april "pairs←{slopes(+⍣⍵)1 1}¨⍳3")

(april "f←{+[2]}")
(april-f "(slopes+[2] 5 5)+[2] 5 5 ")
(april "{(slopes+[2])⍣⍵⊢1 1}¨⍳2")
(april "{(slopes,[2])⍣⍵⊢2 2}¨⍳2")

(april "(5∘+) 6")

(april-f "slopes,[0.5] 2  ")

(april-f "slopes+slopes+slopes") ; stack them side by side
(april-f "slopes+⍣1⊢5 2 ⍴ 1 1")
(april "⍴slopes")
