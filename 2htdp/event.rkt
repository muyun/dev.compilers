#lang racket
"""
2.5 Programs 
note: a batch program 
         - composition of auxiliary functions
      an interactive program
         - an event-driven program uses an expression
         to describe which functions to call 
"""

(require 2htdp/image 
         2htdp/universe
         (only-in pict show-pict))

(define (number->square s)
  (square s "solid" "red"))

;(show-pict (number->square 20))

;(define (reset s ke) 100)

;(define cw1 (ke-h cw0 "a"))

(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))

(define (ke-h y ke) 100)
;(define (me-h y me) ke-h "button-down" 90 100)
(define (main y)
  (big-bang y 
    [on-tick sub1]
    [stop-when zero?]
    [to-draw place-dot-at]
    [on-key ke-h]))

(main 90)

;(show-pict (big-bang 100 [to-draw number->square]))

;;
; the design process
;; 
; 1. how to represent information as data   <- formulate data definitions  
;      "we use numbers to represent centimeters"
; 2. write down a function signature  
;      "Number ->  Number"  <- signature
;      compute the area of a square with side len   <- the purpose of the function
;      2 -> 4   <- example
;      (define (area-of-square len) 0)  <- a function header
; 3. illustrate the signature and the purpose with examples 
;
; 5.  coding
(define (area-of-sqaure len) 
  (sqr len))
; 6.   unit-testing
(require test-engine/racket-tests)
(check-expect (area-of-sqaure 2) 5)
(test)
;
;
; ch3.6 - **from a problem statement to a working program systematically** 
;    - The design recipe 
;  
; 1. find out 'physical'/ graphical properties/constants
;    -  to describe general atttibutes of objects in the world
(define WIDTH-OF-WORLD 400)
(define HEIGHT-OF-WORLD 200)
(define BACKGROUND1 (rectangle 
                     WIDTH-OF-WORLD 
                     HEIGHT-OF-WORLD 
                     "outline"
                     "black"))
(define Y-CAR (/ HEIGHT-OF-WORLD 2))

(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle 
               WHEEL-DISTANCE
               WHEEL-RADIUS
               "solid" 
               "transparent"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR-BODY (overlay/align "middle" "bottom"
                                (rectangle
                                 (* 6 WHEEL-RADIUS)
                                 (* 4 WHEEL-RADIUS)
                                 "solid" "blue")
                                (rectangle
                                 (* 12 WHEEL-RADIUS)
                                 (* 2 WHEEL-RADIUS)
                                 "solid" "blue")))
(define CAR (above CAR-BODY BOTH-WHEELS))


; 2. develop a data representation about the world
;    A WorldState is a Number.
;    - interpretation the number of pixels between
;    the left border of the scene and the car

; 3. design functions to form a valid expression
;
;    map any given state into an image
;    WorldState -> Image
;    place the image of the car x pixels from the left margin 
;    of the BACKGROUND image
(define (render x)
  (place-image CAR x Y-CAR BACKGROUND1))

; mouse-event-handler
; WorldState -> WorldState
; add 3 to ws to move the car right
(define (tock ws) (+ ws 3))

; 4. main function -> launch
;  WorldState -> WorldState
; ; launches the program from some state
(define (main1 ws) 
  (big-bang ws
    [on-tick tock]
    [to-draw render]))

(main1 13)
;