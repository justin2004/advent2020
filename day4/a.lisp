(ql:quickload :april)
(ql:quickload :cl-ppcre)
(in-package :april)

; i've never felt solid with newlines in sed. | does not occur in the input.txt so
; let's use it instead...
; cat input.txt | tr '\n' '|' | sed -e 's/||/\n/g' -e 's/|/ /g' > input1.txt
(setf *i* (with-open-file (s "./day4/input1.txt" 
                             :direction :input)
            (loop 
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

; get the input into april
(april (with (:state :in 
              ((i (coerce *i* 
                          'vector)))) )
       "input←i")

; part 1 prep
; 138 too low
(april "+/¨' '=input")
(april "+/¨' '=input")

(april "'cid:'⍷input[1]")
(april "'cid:'⍷¨input")
(april "⍴input[1]")
(april "input[1 2 3]")

(april "i←'cid:33 blah:33' 'blah:22 eid:33'")
(april "i")
(april "input[1 2]")


; (april "input[2]")
; (april "(' '=input[1])")

    ; byr (Birth Year)
    ; iyr (Issue Year)
    ; eyr (Expiration Year)
    ; hgt (Height)
    ; hcl (Hair Color)
    ; ecl (Eye Color)
    ; pid (Passport ID)
    ; cid (Country ID)    not req'd
; 8 total
; 7 req'd

(april "expected_fields←'byr' 'iyr' 'eyr' 'hgt' 'hcl' 'ecl' 'pid'")
(april "(~∨\\¨':'=a⊂input[8])/¨a⊂input[8]")

(april "a←(¯1⌽(' '=input[8])) ⋄ a[1]←1")
(april "⍴expected_fields ∩ (~∨\\¨':'=a⊂input[8])/¨a⊂input[8]")


; part 1
; takes a vector of non-enclosed strings
(april "distinct_fields←{a←(¯1⌽(' '=⍵)) ⋄ a[1]←1
                         ⍴expected_fields ∩ (~∨\\¨':'=a⊂⍵)/¨a⊂⍵}")
(april "+/(⍴expected_fields)=distinct_fields¨ input") ; 260







; scratch 
(april "'hgt' 9 ∩ 'hgt' 1")
(april "22 'ab' 'fg' ∩ 'a' 'ab' 22")
(april "22 'ab' 'fg' ∩ 'ab'")

(april "'hgt'⍷⊃¨a⊂input[1]")
(april "'hgt'⍷'hgt:433' 'hgz:2'")

(april "input[1]")
(april "")

(april "0 1 0 0 1 0⊂⍳10")


(april "⍴input[1]")
*i*

(april-c "{⍴⍵[1]}" 
         (vector "apple" "pasta") )

(april "inp←'apple' 'pasta'
        ⍴inp[1]" )
(april "⍴⊃inp[1]")

(april "'apple' 'pasta'[2]")

(april "input")
