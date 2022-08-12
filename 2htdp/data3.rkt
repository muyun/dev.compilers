#lang racket

; TODO - 6 Itemizations and Structures 
;
; design recipe  
; 
; 1. data definition  
; A UFO is a Posn .
; interpretation (make-posn x y) is the UFO's location
; 
(define-struct tank [loc vel])
; A Tank is a structure: 
; (make-tank Number Number) .
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixeles/tick  
;
; A Missle is a Posn.
; interpretation (make-posn x y) is the missile's place
;
; data representation for two different kinds of game states  
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
; space invader game 
; A SIGS is one of  <- **data definition is an itemization to distinctions among different classes of information**
; - (make-aim UFO Tank) 
; - (make-fired UFO Tank Missile)
; interpretation represents the complete state of a space invader game
;

