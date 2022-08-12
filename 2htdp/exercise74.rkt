#lang racket
;
;(require 2htdp/universe)
(require test-engine/racket-tests)

; exercise 74 
; keep track of an object that moves across the canvas at changing speed 

; 1. data representation and definition 
(define-struct ufo [loc vel])
; a UFO is a structure: 
;   (make-ufo posn vel) 
; interpretation (make-ufo p v) is at location p moving at velocity v

; a posn is a structure - location (x,y)
(define-struct posn [x y]) 
; a vel is a structure - velocity (dx, dy) per tick
(define-struct vel [dx dy])


; create sample structure instances;
;    check the data definition with data examples
(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))
(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))
(define u1 (make-ufo p1 v1))
(define u3 (make-ufo p2 v1))
(define u2 (make-ufo p1 v2))

; 2. wirte down a signature, a purpose, some examples, and a function header
; UFO -> UFO <- signature  
; determines where u moves in one clock tick; leaves the velocity as is  <- purpose  
;(define (ufo-move-1 u) u)  ;<- function header 

;  3. create functional example based on the data examples
(check-expect (ufo-move-1 u1) u3)  ;<- examples
(check-expect (ufo-move-1 u2) (make-ufo (make-posn 17 77) v2))
;(test)

;  4. a function that consumes a structure instance
; extract information from the structure to compute its result 
;(define (ufo-move-1 u)
;  (... (ufo-loc u) ... (ufo-vel u) ...))
; 

(define (ufo-move-1 u) 
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))

; deveop one function per level of nesting
; given posn and the vel to obtain the next location of the UFO
; posn vel -> posn
; adds v to p
;(define (posn+ p v) p) ; <- a wish list 
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))

(define (posn+ p v) 
  (make-posn (+ (posn-x p) (vel-dx v))
             (+ (posn-y p) (vel-dy v))))

; 6. UT
;
(test)

; TODO - check whether struct data equal? 
;

; TODO - 5.10 A Graphical Editor  

