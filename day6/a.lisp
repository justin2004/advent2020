(ql:quickload :april)
(in-package :april)

; cat input.txt  | tr "\n" "|" | sed -e 's/||/\n/g' -e 's/|//g' > input1.txt"
(setf *i* (with-open-file (s "day6/input1.txt" 
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
