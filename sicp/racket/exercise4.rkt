#lang racket

(define (infinite-loop) (infinite-loop))

(if (= 3 6)
    (infinite-loop)
    (/ 4 2))

(define (new-if test then-case else-case)
  (if test
      then-case
      else-case))

(new-if (= 3 6)
        (/ 1 2)
        (/ 4 2))
