⍝  part 2    in dyalog because i couldn't do the powerset function in april

fun←{ input←⍵ ⋄ first←1↑input ⋄ last←¯1↑input ⋄ input←1↓input ⋄ input←¯1↓input ⋄  psv←{⌿∘⍵¨↓⌽⍉2⊥⍣¯1⊢¯1+⍳2*≢⍵}input ⋄ +/∧/¨{(⍵=1)∨(⍵=2)∨⍵=3}¨¯1↓¨{(1⌽⍵)-⍵}¨{first,⍵,last}¨psv }

⍝ sample←0 1 4 5 6 7 10 11 12 15 16 19 22 ⋄ fun sample

input←115 134 121 184 78 84 77 159 133 90 71 185 152 165 39 64 85 50 20 75 2 120 137 164 101 56 153 63 70 10 72 37 86 27 166 186 154 131 1 122 95 14 119 3 99 172 111 142 26 82 8 31 53 28 139 110 138 175 108 145 58 76 7 23 83 49 132 57 40 48 102 11 105 146 149 66 38 155 109 128 181 43 44 94 4 169 89 96 60 69 9 163 116 45 59 15 178 34 114 17 16 79 91 100 162 125 156 65
⍝ the function "fun" could solve the problem directly if my dyalog workspace didn't run out of memory:
⍝     ×/fun input

⍝ fun uses powersets which produces a large vectors so we do powersets on subsequences

sorted←(⊂∘⍋⌷⊢)input
vv1←0,sorted,3+(⍴sorted)⊃sorted ⍝ prepend 0 and append the last item +3
idxs←3=(1⌽vv1) - vv1   ⍝ these indexes can be the guaranteed break points in the sequence
                       ⍝ because they have to be there
vv2←(1+idxs)/vv1    ⍝  duplicate the break points 
idxs2←1,1↓¯1⌽0=(1⌽vv2)-vv2  ⍝ get the different between each item and where the difference is 0
                            ⍝ mark those places (as they will serve as the places to partition)
														⍝ also mark the 1st because partitioned enclose needs it
⎕PP←30
×/fun¨idxs2⊂vv2  ⍝ make subsuquences, and for each apply the function
⍝ 13816758796288
