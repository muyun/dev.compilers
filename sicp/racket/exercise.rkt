#lang racket

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(cond ((= 3 1) 'wrong!)
      ((= 3 2) 'still-wrong!)
      ((= 3 3) 'right!)
      (else 'yay))
