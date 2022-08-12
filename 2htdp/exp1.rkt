#lang racket
; note: a good program **reflects the problem statements and its important concepts**;
;       good programming is about solving problems systematically 
;       and conveying the system within the code;
;       Examples illustrate the description and relate it back to the problem;
;       the examples make sure that the future reader knows **why and how your code works**
;

; functions provide a economic way of computing values with a single expression
(define (sign x) 
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))
(sign 3)


(require 2htdp/universe
         2htdp/image)

; constants
(define WIDTH 200)
(define HEIGHT 60)
(define X 100)
(define V 2)
(define CIR (circle 5 "solid" "red"))


(define CIR-CENTER-TO-TOP (- HEIGHT (/ (image-height CIR) 2)))
(define MTSCN (empty-scene WIDTH HEIGHT))

; functions
(define (picture-of-circle.v4 t)
  (cond
    [(<= (distance t) CIR-CENTER-TO-TOP)
     (place-image CIR X t MTSCN)]
    
    [(> (distance t) CIR-CENTER-TO-TOP)
     (place-image CIR X CIR-CENTER-TO-TOP MTSCN)]))

(define (distance t) (* V t))

; note: refactor - reorganize the program 
; eliminate all repeated expressions  
(animate picture-of-circle.v4)


