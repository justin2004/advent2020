(ql:quickload :april)
(in-package :april)

(setf *i* (with-open-file (s "input.txt" 
                   :direction :input)
  (loop 
    :for line = (read-line s nil)
    :while (not (null line))
    :collect line)))

; get the input into april
(april:april (with (:state :in 
                    ((i (coerce (mapcar #'parse-integer *i*) 
                                'vector)))) )
             "input←i")

; part 1
(april "×/⊃(input∘.,input)[1↑{(2020=⍵)/⍳⍴⍵} (a←,input∘.+input)]")
; is the 1↑ necessary?

;part 2
; NOTE i had to start sbcl with --dynamic-space-size 4096
(april "a←input")
(april "trips←,a∘.,,a∘.,a⋄44")
(april "×/¨trips[(2020=+/¨trips)/⍳⍴trips]")
