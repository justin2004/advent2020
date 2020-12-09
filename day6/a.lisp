(ql:quickload :april)
(in-package :april)

; cat input.txt  | tr "\n" "|" | sed -e 's/||/\n/g' -e 's/|//g' > input1.txt"
; cat input.txt  | tr "\n" "|" | sed -e 's/||/\n/g' > input2.txt"
(setf *i* (with-open-file (s "day6/input-sample2.txt" 
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
(april-f "+/+/¨≠¨input")
; Mv(f⍤1)Nm           Apply f between vector Mv and each row of Nm

; part 2
(april-f "≠¨input")
(april "input")
; For each group, count the number of questions to which everyone answered "yes"."
(april "'abc'∩'a|b|c'∩'ab|ac'∩'a|a|a'∩'b|'")
(april "'ab'∩'ac'")
(april-f "~'|'=input")
(april "1 0 1 0 1⊂'a|b|c'")
(april "∩/¨input")
(april "('|'=input[3])⊂input[3]")
(april "1 0 1 0 0 ⊂ ⊃input[3]")
(april "('|'=input[3])")
(april "∩/'ab' 'ac'")
(april "i←'ab|ac'⋄map←'|'=i⋄map[1]←1⋄map⋄ '|'=map⊂i")

(april "i←'ab|ac'⋄map←'|'=i⋄map[1]←1⋄∩/map⊂i") ; works
(april "i←'ab|ac'⋄map←'|'=i⋄map[1]←1⋄map⊂i") ; works
(april "i←input ⋄ map←'|'=¨i ⋄ map1←1,¨1↓¨map ⋄ map1⊂¨i") ; works on multiple
(april "i←input ⋄ map←'|'=¨i ⋄ map1←1,¨1↓¨map ⋄ ∩/(map1⊂¨i)[1]")
(april "i←input ⋄ map←'|'=¨i ⋄ map1←1,¨1↓¨map ⋄ {∩/⍵}¨map1⊂¨i")
(april "input")
(april "apple←3 ⍴ ⊂⍳10 ⋄ (1↑⊃apple[1])←99")
(april "apple←3 ⍴ ⊂⍳4 ⋄ (1↑⊃apple[1])←99 ⋄ apple")
(april "apple←3 ⍴ ⊂⍳10 ⋄ apple[1]")


(april "aa←(1 0 0) (1 1 0 1 0)⊂¨'abc' 'a|b|c'")
(april "⍴aa[1]")
(april "∩/¨aa") ; resume after https://github.com/phantomics/april/issues/94
(april "{∩/⍵}¨aa")

(april "⊃∩/aa[1]")
(april "aa[1]")
