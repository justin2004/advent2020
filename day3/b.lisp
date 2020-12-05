
; part 2 attempts to handle an arbitary amount of slopes with 3 dimensions


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
(april "pairs←{(5 2 ⍴ 1 1)+⍣⍵⊢slopes}¨¯1+⍳323") ; maybe
(april "pairs←{(5 2 ⍴ 1 1)+⍣⍵⊢slopes}¨⍳10") ; maybe
(april "pairs←{slopes+⍣⍵⊢5 2 ⍴ 1 1}¨¯1+⍳323") ; maybe yes
(april-f "a←pairs[3]")
(april-f "pairs")
(april "goodpairs←{⍵[1],(1+(2⊃⍴mat)|(⍵[2]-1))}¨pairs")
(april "2⊃⍴mat")
(april "goodpairs←{(5 2 ⍴ 31 999)|⊃⍵}¨pairs") 
(april "⎕←gp←goodpairs[1 2 3]")
(april "{4 999|(⊃⍵)}¨pairs") ; come back here
(april "goodpairs[3]")
(april "a←pairs[1] ⋄ ⊃a")
(april "+/gp {⍺⌷⍵}¨ ⊂mat") ; 276
(april-f "aa←3 5 2 ⍴ ∊¨gp") ; reshape this into a 3 5 2
(april-f "gp") ; reshape this into a 3 5 2
; let's assume i can reshape into this
(april-f "bob←3 5 2 ⍴ 1 1 1 1 1 1 1 1 1 1 2 2 4 2 6 2 8 2 2 3 3 3 7 3 11 3 15 3 3 5")
; now get the paths
(april-f "bob")
(april-f "bob[;2;]") ; vol ; row ; col ;; these are the coords for slope 3 1
(april-f "(↓bob[;1;]){⍺⌷⍵}¨⊂mat[⍳18;]")  ; this works but you have to iterate the indexing

(april "mat[⍳15;]")
(april-f "bob")



(april "aa[1;2;1]")
(april "3 5 2 ⍴ gp")
(april-f "3 5 2 ⍴ slopes ")
(april "m←mat[⍳4;]")

(april-f "m")
(april-f "a")

(april-f "slopes") ; update col 1 to be the mod of 2
(april-f "(5 2 ⍴ 4 99) |slopes")
(april "4 99 | 6 7")


(april "(5 2 ⍴ 1 1)+⍣2⊢slopes")
(april-f "(5 2 ⍴ 1 1) + slopes")
(april-f "slopes")

(april "5 2 ⍴ 1 1 +[2] slopes")

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









; last ditch effort before i revert to just wrapping my part 1 solution
; in a function...
(april-f "pairgroups←(1 3) (1 4) ∘.{⍺+⍣⍵⊢1 1} ⍳3")
(april-f "pairgroups[1;]")
(april-f "(1 3) (1 4) ∘., ⍳3")
(april "pairgroups {⍺⌷¨⍵}¨ ⊂mat")
(april "{⍵}¨pairgroups")
; ok function wraping it is
