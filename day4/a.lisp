(ql:quickload :april)
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



; part 2

    ; byr (Birth Year) - four digits; at least 1920 and at most 2002.
(april "byr_valid←{(4=≢⍵) ∧ (1920≤⍎⍵) ∧ 2002≥⍎⍵} ⋄ byr_valid '1920'")
    ; iyr (Issue Year) - four digits; at least 2010 and at most 2020.
(april "iyr_valid←{(4=≢⍵) ∧ (2010≤⍎⍵) ∧ 2020≥⍎⍵} ⋄ iyr_valid '2010'")
    ; eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
(april "eyr_valid←{(4=≢⍵) ∧ (2020≤⍎⍵) ∧ 2030≥⍎⍵} ⋄ eyr_valid '2031'")
    ; hgt (Height) - a number followed by either cm or in:
    ;     If cm, the number must be at least 150 and at most 193.
(april "hgt_valid←{'cm' 'in' ⍳ ⊂(¯2↑⍵)
                   bounds←('cm' 'in' ⍳ ⊂(¯2↑⍵)) ⊃ (150 193) (59 76)
                   value←⍎(¯2↓⍵)
                   (bounds[1]≤value) ∧ value≤bounds[2] }")
(april "hgt_valid '194cm'")

(april "⊂(¯2↑'151in') 0 ⍳ 'cm' 'in'")
(april "'cm' 'in' ⍳ ⊂(¯2↑'151in')") ; works
(april "bounds←('cm' 'in' ⍳ ⊂(¯2↑'64in')) ⊃ (150 193) (59 76)  ")
(april "value←⍎(¯2↓'64in')")
(april "(bounds[1]≤value) ∧ value≤bounds[2]")
    ;     If in, the number must be at least 59 and at most 76.
    ; hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
(april "hcl_valid←{('#'=⍵[1]) ∧ (7=≢⍵)  ∧ 6=+/(1↓⍵) ∊ '0123456789abcdef'}")
    ; ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
(april "ecl_valid←{1↑⍵ 0 ∊ 'amb' 'blu' 'brn' 'gry' 'grn' 'hzl' 'oth'} ⋄ ecl_valid 'hzl'")
    ; pid (Passport ID) - a nine-digit number, including leading zeroes.
(april "pid_valid←{(9=≢⍵) ∧  ∧/⍵ ∊ '0123456789'} ⋄ pid_valid '123456789a'")
    ; cid (Country ID) - ignored, missing or not.


(april "' '=input[8]")
(april "a←(¯1⌽(' '=input[8])) ⋄ a[1]←1⋄a")
(april "⍴expected_fields ∩ (~∨\\¨':'=a⊂input[8])/¨a⊂input[8]")
(april "(':'=a⊂input[8])")
(april "1000100 ⊃ input[8]")
(april "b←a⊂input[8]")
(april "q←{x←¯1⌽(':'=⍵)⋄x[1]←1⋄x}¨b")
(april "q∘.,b")
(april "r←q{⍺⊂⍵}¨b") ; good
(april "{99{⍺,⍵}¨⍵}¨r")
(april "{99,⍵}¨r")
(april "{{⍵[1]}¨⍵}¨r") 
(april "hcl_valid ¯1↓1⊃({⍵[2]}¨r)") ; works but hardcoded
(april "({⍵[2]}¨r)")
(april "'plus' 'minus' ⍳ ⊂'plus'")


; (april "expected_fields←'byr' 'iyr' 'eyr' 'hgt' 'hcl' 'ecl' 'pid'")
; (april "a←(¯1⌽(' '=input[8])) ⋄ a[1]←1")
; (april "(~∨\\¨':'=a⊂input[8])/¨a⊂input[8]")
; (april "input[8]")
; (april "⍴expected_fields ∩ (~∨\\¨':'=a⊂input[8])/¨a⊂input[8]")
; (april "≢'#6b5442'")
; (april "hcl_valid '#6b5442'")
; (april-f "⍸ 3 3 ⍴ 0 0 1   0 0 0    1 1 0")
; (april "∧/(1↓'#6b5442') ∊ '0123456789abcdef'")
; (april "'a'-'a'")
; (april "'#6b5442'")




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

(ql:quickload :bordeaux-threads)
(ql:system-apropos "threads")

(bt:make-thread #'(lambda ()
                    (april "⍳10")))


