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



; part 1 prep
(april "⍎(∨\\' '=⊃input[1])/⊃input[5]")
(april "(1,1↓' '=⊃input[1])⊂⊃input[1]")
(april "(1,1↓' '=input)⊂input")
(april "memory←{⍵[1],⍎⊃⍵[2]}¨(1,¨1↓¨' '=input)⊂¨input")
(april "ip←1")
(april "acc←0")
(april "acc")
(april "{acc←1} 9") ; here

;   -->  ⍵[1] is the ip history (current first)  
;        ⍵[2] is current acc
; instr[1] is op      instr[2] is operand
(april "eval←{$[~∧/≠1⊃⍵ ; ⍵[2] ;
              ⎕←'acc ' ⋄ ⎕←acc←⍵[2]
              ⎕←'ip ' ⋄  ⎕←ip←1 1⊃⍵
              ⎕←'instr ' ⋄ ⎕←instr←ip⊃memory
              ⎕←'op '   ⋄ ⎕←instr[1]
              ⎕←'oper ' ⋄ ⎕←instr[2]
              adjustacc←'acc'≡⊃instr[1]
              dojmp←'jmp'≡⊃instr[1]
              nextip←{ip+instr[2]}⍣dojmp⊢ip+1
              eval (⊂(nextip,1⊃⍵)),{acc+⊃instr[2]}⍣adjustacc⊢acc]}") 
(april "~∧/≠1 2 3 ")
; returns next ip and new acc
(april "eval⍣8⊢ (1,⍬) 0")
(april "eval (1,⍬) 0")
(april "a←(1,⍬) 0 ⋄ 1 1⊃a")
(april "memory")

(april "ff←{⍺←⍵}")
(april "acc ff 8")
(april "acc←99")
(april "{acc←99}")


(april "{101}⍣('nop'≡⊃(1⊃memory)[1])⊢111")
(april "{101}⍣('nop'≡'nop')⊢111")

(april "{101}⍣1⊢99")
(april "{11}⍣1⊢0")
(april "acc")
(april "memory")
(april "⊂/1 2 3")
(april "⍎' +0'")
(april "input")
(april "∨/ 1 0 1")

(april "f←{909+1}")
(april "f←{909+1} ⍝  hello")
(april "f")

; Mv(f⍤1)Nm           Apply f between vector Mv and each row of Nm
