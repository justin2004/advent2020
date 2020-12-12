(ql:quickload :april)
(ql:quickload "md5")
(ql:quickload :cl-ppcre)
(in-package :april)

;cat input-sample.txt  | sed -e 's/contain/|/g' -e 's/bags*//g' -e 's/ [0-9]*//g' -e 's/,/|/g' -e 's/\.//g' -e 's/ //g' | grep -v 'noother' > input-sample2.txt
(setf *i* (with-open-file (s "day7/input-sample2.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

; TARGET-STRING, START, END, MATCH-START, MATCH-END, REG-STARTS, and REG-ENDS.

(numberify "jdjdjd|jfff")

(defun numberify (str) 
  (ppcre:regex-replace-all "[|]" 
                           (cl-ppcre:regex-replace-all "[a-z]*" 
                           str 
                            #'(lambda (target start end match-start match-end &rest r)
                                (format nil "~A" 
                                        (reduce #'+ 
                                                (coerce (md5:md5sum-string 
                                                          (subseq target match-start match-end))
                                                        'list)))))
                           " "))

(md5 "hello")
(reduce #'+ (coerce (md5:md5sum-string "plumgol")
                  'list))
(ql:system-apropos "md5")

; get the input into april
(april (with (:state :in 
              ((i (apl-format-array (coerce (mapcar #'numberify *i*)
                                             'vector))))) )
       "input←i")



; part 1 prep
(april "input")
; Mv(f⍤1)Nm           Apply f between vector Mv and each row of Nm
(april "a←' '=input ⋄ {⍵[1]←1}¨a ⋄ b←a⊂¨input ⋄ c←{{⍎⍵}¨⍵}¨b ⋄ d←{⍵[1],⍵[1+⍳¯1+⍴⍵]}¨c ") ; now they are numeric -- arbitrary len
(april "a←' '=input ⋄ {⍵[1]←1}¨a ⋄ b←a⊂¨input ⋄ c←{{⍎⍵}¨⍵}¨b ⋄ d←{⍵[1]∘.,⍵[1+⍳¯1+⍴⍵]}¨c ") ; now they are numeric pairs
(april "{∊⍵}¨d")
(april "⊃,/d") ; yes!   flatten
(april "{⊃⍵}¨¨¨d")
; {⊃,/⊆¨⍵}⍣≡Y}
(april "{⊃,/⊆¨⍵}⍣≡d")
(april "{⊃,/⊆¨⍵}⍣≡ ('aaa' 'bbb')(('ccc' 'ccc' 'ccc') 'ddd') (⊂'eee')")
(april "1+∘÷⍣=1")
(april "({⍵×2}⍣3) 2 ")
; {X}(f⍣g)Y
; If right operand g is a scalar-returning dyadic function, then left operand function f is applied repeatedly until ((f Y) g Y)  
(april "{⍵×2}⍣=30")
(april "+∘÷/ 40 ⍴ 1.0")

(april "2○⍣=1")
(april "÷∘2⍣=1")
(april "⊢⍣=9")
(april (demo))
(april "'contains' 'contain' (∊⍨)¨ 'hello' 'contains'")

(april "2*3")
(april "{,¨⍵}¨d")
(april "∊d")
(april "a←' '=input ⋄ {⍵[1]←1}¨a ⋄ b←a⊂¨input ⋄ c←{{⍎⍵}¨⍵}¨b ⋄ {1∘.,⍵[¯1+⍴⍵]}¨c ")
(april "a←'|'=input ⋄ {⍵[1]←1}¨a ⋄ b←a⊂¨input  ⋄ c←⊃b[1] ⋄ c[1]∘.,c ")
(april "4 5 ,¨ 8 9 0")
(april-f "4 5 ∘., 8 9 0")
(april-f "1 2 3 (,⍤1) z")


; light plum bags contain 1 faded blue bag.
; vibrant aqua bags contain 5 posh plum bags, 5 faded tomato bags, 5 shiny tomato bags, 1 mirrored orange bag.


1 light plum  
2 vibrant aqua 
3 posh plum
4 faded tomato
5 shiny tomato
6 mirrored orange
7 faded blue
;;;;;;;;;;
bag contains
1 7 
2 3 
2 4
2 5
2 6
5 1 ; i added
4 1 ; i added

1 0  
5 0
5 0
5 0
1 0
1 0

(april "a←7 2 ⍴ 1 7 2 3 2 4 2 5 2 6 5 1 4 1 ⋄ b←(↓a) ∘., ↓a ⋄ c←{⍵[2] = ⍵[3]}¨b ⋄ c/b")
;                   now drop all non 1

; Mv(f⍤1)Nm           Apply f between vector Mv and each row of Nm
(april-f "z←2 2 ⍴ ⍳4 ⋄ (↓z)∘.,↓z")
(april-f "↓z")
(april-f "1 2 3 (,⍤1) z")

(april "j← 7 2 ⍴ 1 8 2 3 2 4 2 5 2 6 5 1 4 1")
; looking for light plum containers
(april "(1=j[;2])/⍳1⊃⍴j")
(april "j[ (1=j[;2])/⍳1⊃⍴j  ;]")
(april "j[0 0 1;]")



(april-f "3 2 10 ⍴ ''")

(april "apple←3 ⍴ ⊂⍳4 ⋄ (1↑⊃apple[1])←99 ⋄ apple")


(april "z←(2 3) (3) (2 4) (1 5) (3)")
(april "{{⍵/⍳⍴⍵}¨↓⍵} z")
(april-f "{⍉(⍳⍴⍵)∘.∊⍵} z")
(april "z")

(april "z path 4 3")
(april "$[0=1;99]")
(april "x←{⍺⍺}")
(april "my_operator←{⍺⍺ ⍵}")
(april "÷  my_operator 99")
(april "fib←{$[(⍵=1)∨⍵=2;1;(fib (⍵-2))+fib (⍵-1)]}")
(april "fib←{$[(⍵=1)∨⍵=2:1 ⋄ (fib (⍵-2))+fib (⍵-1)]}")
(april "fib¨⍳7")
(april "fib←{$[(⍵=1)∨⍵=2;1;(∇ (⍵-2))+∇ (⍵-1)]}")

; i think i am going to wait until operator defs are supported in april
; so i can use the path library function
(april "path←{			  ⍝ Shortest path from/to ⍵ in graph ⍺.
              graph(fm to)←⍺ ⍵	    ⍝ graph and entry/exit vertex vectors
              fm{			 ⍝ fm is the starting-from vertex
              $[⍺≡⍬;⍬]		   ⍝ no vertices left: no path
              $[∨/to∊⍺;⍬](⊃∘⍵){	  ⍝ found target: path from tree:
              $[⍵<0;⍺]	       ⍝ root: finished
              (⍵,⍺) path ⍺⍺ ⍵	 ⍝ accumulated path to next vertex
              }1↑⍺∩to		 ⍝ found vertex ⍺
              next←graph[⍺]∩¨⊂⍸⍵=¯2   ⍝ next vertices to visit
              back←⊃,/⍺+0×next	⍝ back links
              wave←⊃,/next	    ⍝ vertex wave front
              (∪wave) path back@wave⊢⍵    ⍝ advanced wave front
              }¯2+(⍳⍴⍺)∊fm		⍝ null spanning tree
}")

(april "graph←0 ⋄ a←0 ⋄ b←0")
(april "graph (a b) ← 99 (2 3) ")
(april "graph")
(april "a")
(april "b")
