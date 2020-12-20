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
(april "⍴a")
(april "b←((⍳⍴a)-1)↓¨⊂a")
(april "⍴b")
; (april "b←((⍳⍴a)-1)↑¨⊂z")
(april "c←((⍳⍴a)-1)∘.↑b")

(april "c←(100+⍳100)∘.↑b ⋄ 0")
(april "d←(,c),¨[0.5](¨+/¨,c) ⋄ 0") ; seq first then sum
(april "res←{(sum=¯1↑⍵)∧({(1↑⍵)+¯1↑⍵}¯1↓(⊂∘⍋⌷⊢)⍵)}¨d ⋄ 0")
(april "res/⍨0≠⊃¨res") ;    p2 54142584

(april "⍴c")
(april "⍳(⍴a)÷10")
(april "⍴c")
(april ",c")
(april "⍴d" )
; (april "d←(,c),[0.5](¨+/¨,c)") 
(april "{((127=¯1↑⍵)+1)⊃0 ((¯1↓⍵)[⍋¯1↓⍵])}¨d")
(april "{((127=¯1↑⍵)+1)⊃0 (¯1↓⍵)}¨d")

(april "{(127=¯1↑⍵)∧((⊂∘⍋⌷⊢)¯1↓⍵)}¨d") ; error -- bug?
(april "{(127=¯1↑⍵)∧((⊂∘⍋⌷⊢)⍵)}¨d") ; works


(april "6 4 9 1[⍋6 4 9 1]")
(april "{⍋¯1↓⍵} 1 8 3 0 4")
(april "(⊂∘⍋⌷⊢)1 8 3 0 4")
(april "d")
(april "1 ∧ 5")
(april "1 2 ((tt←3),uu←99)")
(april "uu")
(april "{127=¯1↑⍵}¨d")
(april "2⊃5 6")
(april "+/¨,c") ; ish
(april "+/¨,c")
(april-f "1 2 3 ,[0.5] 5 6 7")
(april-f "1 2 3 ,¨ 5 6 7")
; 1 ↑ 1↓a
; 1 ↑ 2↓a
; 1 ↑ 3↓a
;...
; 2 ↑ 1↓a
; 2 ↑ 2↓a
(april "(⍳5){⍺↑⍵}a")
(april "33")
(april "a")
(mapcar #'(lambda i a)
        (april-c ""))
(april-c "{⍋⍵}" (vector 89 88))
(april "(⍳4)⌷a")
(april "1 2 3,¨9 8")

; 1↑a
; 2↑a
; 3↑a

;;;;;;;;;

(april "1 2 3⊣3 5 6")


(ql:quickload "lparallel")

(setf lparallel:*kernel* (lparallel:make-kernel 1))

(progn
  (let ((output (make-array '(20 20) :initial-element 0 :element-type '(unsigned-byte 7))))
    (check-type output simple-array)
    (pdotimes (i (array-total-size output) output)
      (setf (row-major-aref output i) 1)))

  (let ((output (make-array '(20 20) :initial-element 0 :element-type '(unsigned-byte 4))))
    (check-type output simple-array)
    (pdotimes (i (array-total-size output) output)
      (setf (row-major-aref output i) 1))))






(april "d←3 ⍴ ⊂⍳4")
(april "d←d,⊂1 5")
(april "bob←{((5=¯1↑⍵)+1)⊃¯1 (⊂⊂⊂⍵)}¨d")
(april "≡bob[4]")
(april "⊂⊂1 2")


(april "d←3 ⍴ ⊂⍳4")
(april-f "{2⊃¯1 (⊂⊂⊂⊂⊂⊂⊂⊂⍵)}¨d")
