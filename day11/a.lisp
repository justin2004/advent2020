(declaim (optimize (speed 0) (safety 3) (debug 3)))
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
(april-f "↑¯1+{'.L#'⍳⍵}¨input")
; now 
; . 0
; L 1
; # 2
; (april-f "↑¯1+{'.L#'⍳⍵}¨input")

; (april-f "m←↑¯2+{'.L#'⍳⍵}¨input")
(april-f "+/[1]¯1 0 1 ⌽¨ ⊂m")



; start
(april "biginput←11 11↑↑input")
(april "biginput[;11]←'.'")
(april "biginput[11;]←'.'")
(april "biginput")
(april "m←'#'=biginput") ; occupied
(april "m←'#'=new") ; 2nd pass
(april "m←new") ; 2nd pass with numerics
(april "seat←'.'≠biginput") ; a seat


; If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
; If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
; Otherwise, the seat's state does not change.

(april-f "adjCount←  ⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m") 
(april-f            "⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m")
(april "m")
(april "realAdjCount←adjCount-m") ; real adjacent (since the seat itself adjacent to itself)

(april-f "notOcc←0=m") ; set not occupied
; (april-f "new←'.#'[1+seat ∧ noAdj ∧  notOcc]")
(april   "new←m") ; otherwise, the state does not change
(april-f "new←new ∨ seat ∧ (0=realAdjCount) ∧  notOcc")
(april "seat")
(april-f "new←0⌈new - seat ∧ (3<realAdjCount) ∧ ~notOcc") ; TODO these should become empty  -- set the corresponding items in m to 0
(april-f "            seat ∧ (3<realAdjCount) ∧ ~notOcc") ; TODO these should become empty  -- set the corresponding items in m to 0
(april "new-new∧seat")
(april "~seat")
; should i turn off the non-seats?
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
(april-f "11 11↑new")
; . becomes L if a seat
(april-f "'.L'[1+seat∧'.'=new]")
; (april-f "seat∧'.'=new")



(april "m←4 4 ⍴ ⍳ 4")
(april "(2 2 ⌷m)←99")
(april "m")
