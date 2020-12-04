(ql:quickload :april)
(ql:quickload :cl-ppcre)
(in-package :april)

; cat input.txt | sed -e 's/\ (^ [0-9]*\)-/\1 /' -e 's/://' > input1.txt
(setf *i* (with-open-file (s "./day3/input.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

(car *i*)

(defun convert-line (str) 
  "turn the first 2 items into ints and keep the last 2 as strings "
  (let* ((lis (coerce (multiple-value-bind (a b)
                        (ppcre:scan-to-strings "([0-9]*) ([0-9]*) ([a-zA-Z]*) ([a-zA-Z]*)"
                                               str)
                        b)
                      'list))
         (firstint  (parse-integer (first lis)))
         (secondint (parse-integer (second lis))))
    (coerce  `(,firstint 
                ,secondint
                ,@(subseq lis 2))
             'vector)))

; get the input into april
(april (with (:state :in 
              ((i (coerce *i* 
                          'vector)))) )
       "input←i")

; part 1
(april "(1 (⊃⍴ input)) ⍴ input")
(april "input[1]")
(april "'.'=input[2]")
(april "'.'=input")
(april "'.'=input")
(april "a←('.'=input)[1]")
(april "⍴⊃a")

(april "bob←'a'='abcd' 'efgh'")
(april "⊃¨bob")
(april "⍴input[1]")

(april "mat←(⊃⍴input) (⊃⍴input[1]) ⍴ '#'=∊input") ; trees are 1s
; right 3 down 1
(april "m←mat[1 2 3 4 5 ; ]")
; generate the pairs
; 1 1
; 2 4
; 3 7
(april "⍴mat") ; 31 cols   means 1 - 31 are valid indexes
;                31->31 , 32 -> 1 , 33 -> 2
;               ---
;               0 - 30 are valid
(april "1+31|(30-1)")
(april "31|62")
(* 2 31)

(april "1 3 + 1 3 + 1 1")
(april "1 3+⍣1⊢1 1")
(april "⎕IO←0")
(april "⎕IO")
(april "pairs←{1 3+⍣⍵⊢1 1}¨¯1+⍳323")
(april "goodpairs←{⍵[1],(1+31|(⍵[2]-1))}¨pairs") ;the +1 -1 game because i can't get ⎕IO←0
(april "pairs←{1 3+⍣⍵⊢0 0}¨1 2 3")
(april "31|5")
(april "2 4 ⌷ m")
(april "{⍵⌷mat}¨pairs[⍳29]")
(april "pairs[31]")
(april "{⍵⌷mat}¨(1 1) (2 2)")
(april "(1⊃⊃pairs[1])←⊃pairs[1]")
(april "(1⊃⊃pairs[1])")


(april "pairs" )
(april "g←{⍺⌷⍵}")
(april "((1 1) (1 1)) {⍺⌷⍵}¨ ⊂mat")
(april "+/goodpairs {⍺⌷⍵}¨ ⊂mat")    ; not 77 , not 37 , 276 is it
(april "((2 2) (3 3)) {⍺}¨ ⊂2 2⍴7")
(april "1 1⌷mat")
(april "1 2 g mat")

(april-f "5 2 ⍴⍳10")


(april "m[0;0]")

(april "x←((1 2) (3 4) (19 5))")
; now 4|x the first
(april "{4|⍵[1],⍵[2]}¨x")

(april "2 3 ⌷m")
