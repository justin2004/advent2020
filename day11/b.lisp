(declaim (optimize (speed 0) (safety 3) (debug 3)))
(optimize  (speed))
(proclaim)
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day11/input-sample.txt" 
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
(april "'.'=¨input ") ; this
(april "'.'=¨'one   ' 'two.  ' 'three         ' 'four    '")

;;;


; part 1
(april-f "'.L#'=↑input ")
(april-f "'.L#'=¨input ")
(april-f "↑{'.L#'=⊂⍵}¨input") ; almost
(april-f "↑input")
(april "'.-'[1 1 2 1]")
(april "⍴¨input")
(april "'.L#'[1 2 3 3]")      ; numbers to chars
(april "'.L#.' ⍳ '.L##LL'")      ; chars to nums

; . 1
; L 2
; # 3
(april "↑{'.L#'⍳⍵}¨input")
(april-f "↑¯1+{'.L#'⍳⍵}¨input")
; now 
; . 0
; L 1
; # 2
(april-f "↑¯1+{'.L#'⍳⍵}¨input")

(april-f "m←↑¯2+{'.L#'⍳⍵}¨input")
(april-f "m")
(april-f "+/[1]¯1 0 1 ⌽¨ ⊂m")



; start
(april "m←'#'=↑input") ; occupied
(april "m←'#'=new") ; 2nd pass
(april "m←new") ; 2nd pass with numerics
(april "seat←'.'≠↑input") ; a seat


; If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
; If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
; Otherwise, the seat's state does not change.

(april-f "adjCount←  ⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m") 
(april-f            "⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m")
(april "m")
(april "adjCount")

(april-f "notOcc←0=m") ; set not occupied
; (april-f "new←'.#'[1+seat ∧ noAdj ∧  notOcc]")
(april   "new←m")
(april-f "new←seat ∧ (0=adjCount) ∧  notOcc")
(april-f "seat ∧ (3<adjCount) ∧ ~notOcc") ; TODO these should become empty  -- set the corresponding items in m to 0
(april-f "new")
(april-f "'L#.'[1+(2×~seat) + new]"); render works
(april-f "                    new "); render works
(april-f "1+new+s")
(april "4 ∧ 2")
(april "⎕←zz←5 5 ⍴ 0")
(april "m←(∘.=⍨⍳5)")
(april "m")
; 0 L empty
; 1 # occupied
; then at the end use the seat mask

; (april-f "newWide←' '=¯1⊖¯1⌽12 12 ↑new") ; need to add a layer of chairs around the edge
(april-f "newWide←' '=11 11 ↑new") ; need to add a layer of chairs around the edge
; . becomes L if a seat
(april-f "'.L'[1+seat∧'.'=new]")
; (april-f "seat∧'.'=new")



(april "m←4 4 ⍴ ⍳ 4")
(april "(2 2 ⌷m)←99")
(april "m")


;;;;;;;;;;;;;;;;;;;;







(april  "my_operator← {⍺⍺ ⍵}")
(april "÷ my_operator 5.0")
0.2
(april "(q w)← (1 2)")


(april "a←(2 3) 3 (2 4) (1 5) 3")
(april "a←(2 3) 3 (2 4) (1 4) 3")
(april "a")
; a path 4 3                      ⍝ a shortest path from 4 to 3.
; 4 1 3
(april  "op←{ ⎕←'here1'
         ⎕←'op om ' ⋄ ⎕←⍵
         ⎕←'op al ' ⋄ ⎕←⍺
         ⎕←'op aa ' ⋄ ⎕←⍺⍺
         $[⍵<0;⍺; ⎕←'here99'
            (⍵,⍺) op ⍺⍺ ⍵] }")
;          1,5 op + 1
(april "(1,5) op 1")
(april "aop←{⍵⍵ 7}")
(april "1 aop - 4")
(april "(1,5) aop + 1")
(april "5 + op ¯1")
(april "5 + op 1")

(april "⍬ (⊃∘¯2 ¯2 ¯2 ¯1 ¯2) (0)")
(april "⎕IO←1")

(april "$[1=2 ; 99 ; ⍬ (⊃∘¯2 ¯2) op 1↑7∩9]")
(april "⍬ (⊃∘¯2 ¯2) op 1↑7∩9")
(april "⍬ (⊃∘¯2 ¯2 ¯2 ¯1) op 1↑a∩3") ; this

(april "someop←{⎕←'la ' ⋄ ⎕←⍺⍺ ⋄ ⍺⍺ ⍵}")
(april "someRecOp←{⎕←'in' ⋄ $[⍺=0;⍵;(⍺-1) ⍺⍺ someRecOp (⍵-1)]}")
(april "6 + someRecOp 9")
(april "⍬(⊃∘9 8 7 6) someop 3")
(april "(⊃∘9 8 7 6)")
                   
(funcall  (operate-reducing #'(lambda () 2) "+" 1 )   '(44 99)) 
(april "1↑3 ∩ 7")
(rank #0A#(4 4))
(rank #(4 4))
(april "a path 4 3")
(april "path←{⎕←'graph ' ⋄ ⎕←graph←⍺
              ⎕←'fm ' ⋄ ⎕←fm←⍵[1]
              ⎕←'to ' ⋄ ⎕←to←⍵[2]
              ⍝ ⎕←'about to call fm '
             fm {⎕←'al ' ⋄ ⎕←alpha←⍺
                 ⎕←'om ' ⋄ ⎕←omega←⍵
                 $[alpha≡⍬;⍬;
                   ⎕←'here0' ⋄ ⎕←alpha∩to ⋄ $[⎕←'here2 :' ⋄ ⎕←∨/to∊alpha ⋄ ∨/to∊alpha;⍬ (⊃∘omega) op 1↑alpha ∩ to;
                     next←graph[alpha]∩¨⊂⍸omega=¯2
                     back←⊃,/alpha+0×next
                     wave←⊃,/next
                     (∪wave)path back@wave⊢omega]]
              } ¯2+(⍳⍴⍺)∊fm }")

(april "{ 5{⍵+1}⍵} 0")
(april " 5{⍵+1}9")
(april "$[1=2;9;99]")
(april "myo←{⍺⍺ ⍵}")
(april "(⊃∘5 6 7) myo 2")
(april "(⊃∘5 6 7){⍺⍺ ⍵}2")
(april "3(⊃∘6 7 8)2") ; 7
(april "$[1=2;99;$[1=1;505;400]]")

(april "(⊃∘5 7)2")
(april "2⊃5 7")

(april "{⍵+{⍵-2} 5} 66")
(april "bob←{⎕←om←⍵ ⋄ 1 + om}")
(april "bob 55")

(april "{⌿∘⍵¨↓⌽⍉2⊥⍣¯1⊢¯1+⍳2*≢⍵}'abc'")
(april "⍴{⌿∘⍵¨↓⌽⍉2⊥⍣¯1⊢¯1+⍳2*≢⍵}⍳14")






(april "fred← {fred 8, {⍵}⍣0⊢7}")
(april "joe←{⍺ joe 8, {⍵}⍣0⊢7}")


(keywordp :bobby)
(do-symbols (sym :keyword)
  (format t "~A~%" sym))
(in-package :keyword)

(sort )
