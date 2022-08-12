#lang racket
; programming languages are about computing with information,
; and information comes in all shapes and form.
; 
; combine data and the related operations  
; 

; note: a batch program - consumes all of its inputs at once and computes its result
; programs consist of a main definition and several helper functions  
;
; **the main function compose the helper functions**
; each function per task, and a main function puts it all together  
;

; note: in the case, several quantities depend on each other
; **tease out the various dependencies, one by one**
;
(define (attendees ticket-price)
  (- CURRENT-ATTENDEES (* (- ticket-price CURRENT-PRICE) PRICE-SENSITIVITY)))

; test
;(attendees 4.9)

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  ;(+ FIXED-COST (* ATTENDEE-COST (attendees ticket-price))))
  (* ATTENDEE-COST (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define FIXED-COST 180)
(define ATTENDEE-COST 0.04)
(define CURRENT-PRICE 5)
(define CURRENT-ATTENDEES 120)
(define ATTENDEE-CHANGE 15)
(define PRICE-CHANGE 0.1)
; for each constant mentioned in a problem statement, introduce one constant definition 
(define PRICE-SENSITIVITY (/ ATTENDEE-CHANGE PRICE-CHANGE))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)
;
;

