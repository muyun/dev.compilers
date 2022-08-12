#lang racket

(define (can-drive age)
  (cond
    [(< age 16) '(Not yet)]
    [else '(Good to go)]))

 
(define (divisible? big small)
  (= (remainder big small) 0))

(define (fizzbuzz num)
  (cond
    [(and (divisible? num 3) (divisible? num 5)) 'fizzbuzz]
    [(divisible? num 3) 'fizz]
    [(divisible? num 5) 'buzz]
    [else num] ))


(define (teen? num)
  (and (> num 13) (< num 19)))
