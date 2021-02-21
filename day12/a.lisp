(ql:quickload :april)

(april (with (:state :in
              ((i (coerce (uiop:read-file-lines "/mnt/day12/input.txt")
                          'vector) )))) 
       "input←i")


; what are the unique numbers with L and R
(april "∪1↓¨input/⍨∨/∘⊃¨(⊂'LR')=1↑¨input")

;     x y
; N   0  1
; E   1  0
; S   0 ¯1
; W  ¯1  0


; R L options are  90 180 270
(april "getHeading←{currHeading←⍺
                    dir←1↑⍵
                    amount←⍎1↓⍵
                    turnSign←¯1+2×'R'=dir
                    (1+(∨/'RL'=dir))⊃ ⍺ (360|currHeading+turnSign×amount)
                    }")
; (april "0 getHeading 'L90'")


(april "numericHeadingToVec←{⊃(0 1) (1 0) (0 ¯1) (¯1 0)[0 90 180 270 ⍳ ⍵] }")
; (april "numericHeadingToVec 180")

; (april "0 getOffset 'L90'")
(april "getOffset←{(⍎1↓⍵)×(0 1) (1 0) (0 ¯1) (¯1 0) (numericHeadingToVec ⍺) (0 0) ['NESWF'⍳1↑⍵]}")


(april "f←{hdg←1⊃⍵
           pos←2⊃⍵
           ip←3⊃⍵
           instr←ip⊃4⊃⍵
           action←1↑instr
           amount←⍎1↓instr
           ⍝ update the current heading if R or L
           hdg←hdg getHeading instr
           ⍝  if NSEW or F
           ⍝  call getOffset and add it to current position
           ⍝  else if L or R just change heading  
           hdg,(⊂pos+⊃(1 + action ∊ 'NSEWF') ⊃ (0 0) (hdg getOffset instr)),(ip+1),⍵[4] 
        }")

; ship starts facing east
(april "+/|¨2⊃(f⍣(⊃⍴input)) 90               (0 0)             1                            input")
;                           initial heading  initial position  initial index into input

; 1589
