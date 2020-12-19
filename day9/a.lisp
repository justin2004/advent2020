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
(april "a←{⍎⍵}¨input")
(april "ps←25") ; preamble size
(april "windows←(ps+1)-⍨⍴input")
(april "vs←(-(ps+1))↑¨((ps+1)+⍳windows)∘.↑⊂a")
(april "issum←{(¯1↑⍵),(¯1↑⍵)∊(∘.+⍨ps↑⍵)}¨vs") ; selfie
(april "issum/⍨{0=⍵[2]}¨issum")
