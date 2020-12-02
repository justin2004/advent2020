(ql:quickload :april)
(ql:quickload :cl-ppcre)
(in-package :april)

(setf *i* (with-open-file (s "./day2/input1.txt" 
                   :direction :input)
  (loop 
    :for line = (read-line s nil)
    :while (not (null line))
    :collect line)))

; get the input into april
(april:april (with (:state :in 
                    ((i (coerce (mapcar #'convert-line *i* )
                                'vector)))) )
             "input←i")

(april "⍴input")

(mapcar #'convert-line *i* )
(convert-line (car *i*))

(defun convert-line (str) 
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

;1-3 b: cdefg
(april "⍎ 'input'")
(april "a←input[3]⋄a[4]")
(april "⊃a[4]")
(april "3 5 'r' \"ran\"")
(april "3 5 'r' 'ran'")

(april "a←input[6]")
(april "a←3 5 \"x\" \"xxqxm\"")
(april "a←4 5 \"r\" \"rrrjr\"")
(april "a←1 3 'b' 'cdefg'")
(april "a←input[1]")
(april "a")
(april "\"hi\"≡'hi'")
(april "valid a")
(april "'r'='ran'")
(april "3 5 'r' 'ran'")

(april "a[4]")
(april "count←+/a[3]=a[4]")
(april "valid←count≥a[1] ∧ count≤a[2]")
(april "valid←{ count←+/⍵[3]=⍵[4] ⋄ (count≥⍵[1]) ∧ count≤⍵[2]}")
(april "input[2]")
(april "valid input[2]")

(april "(0=valid¨input)/input")
(april "(valid¨input)/input")
(april "+/valid¨input")
; 578 is too high
