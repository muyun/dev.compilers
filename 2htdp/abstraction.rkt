#lang racket
(require test-engine/racket-tests)
; Abstraction
;
; 14.3 Similarities in Data Definitions
;
; parametric data definitions
; A [List X Y] is a structure:
;  (cons X (cons Y '()))
; a [List STRING BOOLEAN] is a structure (cons String (cons Boolean '()))
(cons "hello" (cons #true '()))
;
; A [Maybe X] is one of:
; - #false
; - X
;
; A [Maybe [list-of String]] is one of:
;  - #false
;  - [list-of String]
(cons "" (cons #false '()))
;
; [Maybe [list-of String]]
; String [list-of String] -> [Maybe [list-of String]]
; returns the remainder of los starting with s
; #false otherwise
(check-expect (occurs "a" (list "b" "c" "d")) #f)
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(define (occurs s los)
  (cond
    [(empty? (rest los)) #f]
    [else
     (if (string=? s (first los))
         (rest los)
         (occurs s (rest los)))]))
;
;
; 15.4 Abstractions from Templates
; note: the design recipe organize functions around
;       the organization of the input data definition
;
;  the template to define a list-processing function
; [X Y] [list-of X] Y [X Y -> Y] -> Y
; applies f(combine) from left to right to each item in lx and b
; (f (list x-1 ... x-n) b) == (f x-n ... (f x-1 b))
(define (reduce combine lx base )
  (cond
    [(empty? lx) base]
    [else (combine (first lx)
                   (reduce combine (rest lx) base ))]))

; [list-of Number] -> Number
(define (sum lon)
  (reduce + lon 0))
(check-expect (sum (list 3 2 1)) 5)
(test)
;
;
; 16.1 Using Abstractions
;   - use them when possible becuase of a working-saving device
;   -
;
