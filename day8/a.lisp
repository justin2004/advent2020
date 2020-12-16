(declaim (optimize (speed 0) (safety 3) (debug 3)))
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day8/input.txt" 
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
(april "memory←{⍵[1],⍎⊃⍵[2]}¨(1,¨1↓¨' '=input)⊂¨input")
;   -->  ⍵[1] is the ip history (current first)  
;        ⍵[2] is current acc
; instr[1] is op      instr[2] is operand
(april-create-workspace s0)
(april (with (:space s0))
       "eval")
(april (with (:restore-defaults) (:space s0)))
(april "eval←{⍵}")
(april "apple←{apple 5}")
(april "n←{$[1=0 ; 5 ; n 8,{⍵}⍣0⊢7]}")
(april "fred←{fred 8,{⍵}⍣0⊢7}")
(april "fred←{}")
; eval returns a vector: acc 1 if it made it to the end 0 if not
(april "eval←{memory←⍺ ⋄ repeat←0 ⋄ ended←0
              $[(repeat←(~∧/≠1⊃⍵)) ∨ ended←((⍴memory)<1 1⊃⍵)  ; ⍵[2],ended ;
              ⎕←'acc ' ⋄ ⎕←acc←⍵[2]
              ⎕←'ip ' ⋄  ⎕←ip←1 1⊃⍵
              ⎕←'instr ' ⋄ ⎕←instr←ip⊃memory
              ⎕←'op '   ⋄ ⎕←instr[1]
              ⎕←'oper ' ⋄ ⎕←instr[2]
              adjustacc←'acc'≡⊃instr[1]
              dojmp←'jmp'≡⊃instr[1]
              nextip←{ip+instr[2]}⍣dojmp⊢ip+1
              memory eval (⊂(nextip,1⊃⍵)),{acc+⊃instr[2]}⍣adjustacc⊢acc]}")
(april "memory eval (1,⍬) 0")
(april "a←⍳5 ⋄ ⍴a")
(april "memory/⍨{'nop'≡⊃⍵}¨memory")
(april "idxsOfNops←(⍳⍴memory)/⍨{'nop'≡⊃⍵}¨memory")
(april "idxsOfJmps←(⍳⍴memory)/⍨{'jmp'≡⊃⍵}¨memory")
(april "{'nop'≡⊃⍵}¨memory")
(april "1 {{(⊂'jmp'),memory[2]}⍣(⍺=⍵)⊢memory[⍵]}¨⍳⍴memory") ; this does 1 at a time
(april "modifyProgram←{idx←⍺
                       memory←⍵
                       {{(⊂'nop'), idx 2⊃memory}⍣(idx=⍵)⊢memory[⍵]}¨⍳⍴memory }"); BUG report -- idx can't be ⍵ but they are the same
(april "1 modifyProgram memory")
(april "4 2⊃memory")
(april "memory")
(april "programs←{⍵ modifyProgram memory}¨idxsOfNops")
(april "programs←{⍵ modifyProgram memory}¨idxsOfJmps")
(april "idxsOfNops")
(april "idxsOfNops")
(april "programs")
(april "memory")
(april "{⍵ eval (1,⍬) 0} 1⊃programs")
(april "{⍵ eval (1,⍬) 0}¨programs")
(april "{⍵ eval (1,⍬) 0}¨⊂memory")

(april "2 {⍺=⍵}¨⍳5")
(april "{{(⊂'jmp'),⍵[2]}⍣('nop'≡⊃⍵)⊢⍵}¨memory") ; works but changes all together
(april "{'jmp'≡⊃⍵}¨memory")
(april "memory")
; Fix the program so that it terminates normally by changing exactly one jmp (to nop) or nop (to jmp).)

; part 2
(april "(8⊃input)←⊂'nop -4'")
(april "input")


(april "a←⍳5")
(april "newa←(3⊃a)←30")
(april "a")
(april "newa")


(april "f←{bob←⍺
           f 3,3}")
(april "9 f 5")
