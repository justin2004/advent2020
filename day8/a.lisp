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
(april "eval (1,⍬) 0")
