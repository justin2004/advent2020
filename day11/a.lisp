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
              ((i (coerce *i*
                                             'vector)))) )
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

(april-f "(2 5) ↑ m")

(april "doround←{
⍝ biginput←11 11↑⍵
biginput←(1 + ⍴⍵) ↑⍵
⍝ biginput[;11]←'.'
biginput[;(⍴⍵[2])+1]←'.'
⍝ biginput[11;]←'.'
biginput[(⍴⍵[1])+1;]←'.'
seat←'.'≠biginput
m←'#'=biginput
adjCount←  ⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m
realAdjCount←adjCount-m
notOcc←0=m
new←m
new←new ∨ seat ∧ (0=realAdjCount) ∧  notOcc
new←0⌈new - seat ∧ (3<realAdjCount) ∧ ~notOcc
(⍴⍵)↑'L#.'[1+(2×~seat) + new]}")

; this solves part 1
(april "+/+/'#'=doround⍣≡↑input")


; start
(april "biginput←11 11↑↑input") ; need an insulating row and col (of floor)
(april "biginput[;11]←'.'")
(april "biginput[11;]←'.'")
(april "seat←'.'≠biginput") ; a seat
; (april "biginput←11 11↑'#'=↑input") ; need an insulating row and col (of floor)

(april "biginput")
(april "m←'#'=biginput") ; occupied
(april "m←'#'=new") ; 2nd pass
(april "m←new") ; 2nd pass with numerics


; If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
; If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
; Otherwise, the seat's state does not change.

(april-f "adjCount←  ⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m") 
(april-f            "⊃+/+/[1]¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂m")
(april              "                   ¯1 0 1 ⌽¨ ⊂m")
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
(april-f "10 10↑'L#.'[1+(2×~seat) + new]"); render works
;done

(april-f "                    new "); render works
(april-f "1+new+s")
(april "4 ∧ 2")
(april "⎕←zz←5 5 ⍴ 0")
(april "m←(∘.=⍨⍳5)")
(april-f "m")
; 0 L empty
; 1 # occupied
; then at the end use the seat mask

; (april-f "newWide←' '=¯1⊖¯1⌽12 12 ↑new") ; need to add a layer of chairs around the edge
(april-f "newWide←' '=11 11 ↑new") ; need to add a layer of chairs around the edge
(april-f "11 11↑new")
; . becomes L if a seat
(april-f "'.L'[1+seat∧'.'=new]")
; (april-f "seat∧'.'=new")



; part 2 prep
; 0 floor
; 1 empty chair
; 2 occupied char
; as soon as you hit a positive number that answers the question
(april "v←0 0 0 1 0 0 0 2 0")
(april "v←0 0 0 0 0 0 0 0 0")
(april "1↑v/⍨0≠v") ; first non-floor thing
(april "fnft←{1↑⍵/⍨0≠⍵}") ; first non-floor thing
;;;; 
(april "M←10 10 ⍴ 0 ⋄ M[3;4]←1 ⋄ M[3;1]←1")
(april "N←10 10 ⍴ 0 ⋄ N[3;6]←2 ⋄ N[3;4]←1 ") ; seat
(april "⎕←N")
(april "⎕←⍉↑⊃∘fnft¨¨↓(⍳9) ∘.↓ ↓N") ; works to the right 
(april "M")
(april "N")
(april "+/[1]M")
; Mv (f⍤1)Nm     Apply f between vector Mv and each row of Nm)
(april "(+/⍤1)M")
(april "+/M")
(april "+/[1]M")
(april "M")

; (⍋⍤1) cmat    ⍝ grade-up by row)
(april "⎕←cmat←2 3 ⍴ 'abczyx'")
(april "⎕←(⍋⍤1) cmat")

; Mv (f⍤0 1)Nm   Apply f between vector Mv and each column of Nm)
(april "2(+⍤0 1)M")
(april "1(+⍤1)M")

(april "∨/1⌽M") ; positive pulls
; need pulls 1 - 9 so i need append, rotate(pull)), then take
(april "∨/10 10↑4⌽M,10 9 ⍴ 0")
(april "10 10↑4⌽M,10 9 ⍴ 0")

(april "      4⌽M,10 9 ⍴ 0")
(april " 10 10 ↑[2 3](⍳9)∘.⌽M,10 9 ⍴ 0") ; would work in dyalog
(april "            ⍴(⍳9)∘.⌽M,10 9 ⍴ 0")
(april "(⍳4)∘.+8")

(april "cube←3 4 5 ⍴ ⍳20 ⍝ vol row col")
(april "cube")
(april "2 2↑[2 3] cube")
(april-f "2 2↑     cube")

(april "3 3↑4 5 ⍴ ⍳20")


; from andrew
(april "m←10 5 ⍴ ⍳10")
(april "{{⍵,⌽⍵} (0,-⊢/⍴⍵)↓⍵} m")
(april "{{⍵,⌽⍵} (0,-⊢/⍴⍵)↑⍵} m")
(april "{⍵,⌽⍵} m")
(april "{(0,-⊢/⍴⍵)↓⍵} m")
(april "0,-⊢/⍴m")
(april "-⊢/⍴m")
(april "{{⍵,⌽⍵} (0,⊢/⍴⍵)↑⍵} m")
(april "(0,-⊢/⍴m)↓m")
(april "10↓m")
(april "0,-⊢/⍴m")
(april "m←100× 10 10 ⍴ ⍳5 ")
(april "{{⍵,⌽⍵} (0,⊢/⍴⍵)↑⍵} m")
