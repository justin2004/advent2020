(ql:quickload :april)
(ql:quickload :cl-ppcre)
(in-package :april)

; cat input.txt | sed -e 's/\ (^ [0-9]*\)-/\1 /' -e 's/://' > input1.txt
(setf *i* (with-open-file (s "./day2/input1.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

(defun convert-line (str) 
  "turn the first 2 items into ints and keep the last 2 as strings "
  (let* ((lis (coerce (multiple-value-bind (a b)
                        (ppcre:scan-to-strings "([0-9]*) ([0-9]*) ([a-zA-Z]*) ([a-zA-Z]*)"
                                               str)
                        b)
                      'list))
         (firstint  (parse-integer (first lis)))
         (secondint (parse-integer (second lis))))
    (coerce  `(,firstint 
                ,secondint
                ,@(subseq lis 2))
             'vector)))

; get the input into april
(april (with (:state :in 
              ((i (coerce (mapcar #'convert-line *i* )
                          'vector)))) )
       "input←i")

(april "valid←{ count←+/⍵[3]=⍵[4] ⋄ (count≥⍵[1]) ∧ count≤⍵[2]}")
(april "+/valid¨input")

