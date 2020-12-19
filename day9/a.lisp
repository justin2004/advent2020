(declaim (optimize (speed 0) (safety 3) (debug 3)))
(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "day9/input.txt" 
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

; this solves part 1
(april "memory eval (1,⍬) 0")


(april "idxsOfNops←(⍳⍴memory)/⍨{'nop'≡⊃⍵}¨memory")
(april "idxsOfJmps←(⍳⍴memory)/⍨{'jmp'≡⊃⍵}¨memory")
; (april "1 {{(⊂'jmp'),memory[2]}⍣(⍺=⍵)⊢memory[⍵]}¨⍳⍴memory") ; this does 1 at a time

; you have to manually change between 'nop' and 'jmp' as needed
(april "modifyProgram←{idx←⍺
                       memory←⍵
                       {{(⊂'nop'), idx 2⊃memory}⍣(idx=⍵)⊢memory[⍵]}¨⍳⍴memory }"); april BUG i think -- idx can't be ⍵ but they are the same
; (april "1 modifyProgram memory") ; example call
(april "programs←{⍵ modifyProgram memory}¨idxsOfNops")
(april "programs←{⍵ modifyProgram memory}¨idxsOfJmps")
; part 2
(april "{⍵/⍨⍵[2]=1}¨{⍵ eval (1,⍬) 0}¨programs")


(ql:quickload :opticl)
(ql:quickload "drakma")

(let* ((somejpg (multiple-value-bind (a &rest b) 
                   (drakma:http-request "https://www.makeitgrateful.com/wp-content/uploads/2018/11/home-alone-wet-bandits.jpg")
                   a)))
  (write-byte-vector-into-file somejpg 
                               "/tmp/la0.jpg"
                               :if-exists :overwrite))

(with-open-file (s "/tmp/la.jpg" 
                   :direction :output
                   :if-exists :overwrite
                   :if-does-not-exist :create)
  (write-byte-vector-into-file somejpg "/tmp/la0.jpg"))


(make-echo-stream   )

(opticl:read-jpeg-stream  )

(april "100 ?10")
(let* ((ar (april "30 30 ⍴ 100")))
  (with-open-file (s "/tmp/la.png" :direction :output :if-does-not-exist :create )
    (opticl:write-png-file "/tmp/la0.png"
                             (make-array (array-dimensions ar)
                                         :element-type '(unsigned-byte 8)
                                         :initial-contents (array-to-list ar)))))

(open)
(with-open-file (s "/tmp/la.png")
  33)

(setf ar (april "30 30 ⍴ 150"))

(make-array (array-dimension ))
