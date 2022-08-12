#lang racket
; 1. basic data: numbers, strings, images, boolean values
; 2. ranges of data: enumerations, intervals 
; an enumeration defines **a collection of data** as a finite number of pieces of data ;
; 3. structure-based data
;
; **data definition** is to describe parts of the universe
; and to name these parts so that we can refer to them concisely
; 
; TODO - 5.8  - design recipe
;  1. data definitions with examples 
;      An R3 is a structure:
(define-struct r3 [x y z])
;      (make-r3 Number Number Number)
;
;      structure instances:
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))
;  
;  2. write down on functions signature 
;     R3 -> Number
;     compute the distance of objects in a 3-dim space to the origin
;    (define (r3-distance-to-0 p) 0)

;  3.  use the examples from 1 step to create functional examples
;      
;  5.  coding
(define (r3-distance-to-0 p)
  (sqrt (+ (* (r3-x p) (r3-x p))
           (* (r3-y p) (r3-y p))
           (* (r3-z p) (r3-z p)))))

;  5. ut
(require test-engine/racket-tests)
(check-expect (r3-distance-to-0 ex2) 3)
(test)
;
