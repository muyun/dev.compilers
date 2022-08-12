#lang racket
;http://www.cs61as.org/textbook/homework-0.2.html
(require racket/trace)

(require "str.rkt")
;(provide (all-defined-out))
;

; ex1
; the first two ch of the wd
(define (first-two wd)
  (word (word-first wd) (word-first (word-bf wd))))

;
(define (two-first wd1 wd2)
  (word (word-first wd1) (word-first wd2)))

(define (two-first-sent lst)
  (word (word-first (first lst)) (word-first (first (rest lst)))))

;ex2
(define (teen? num)
  (and (>= num 13) (<= num 19))
  (error "Not yet implemented"))


;ex3
(define (indef-article wd)
  (if (vowel-start? wd)
      (word "an" " "  wd)
      (word "a" " " wd)))

(define (vowel-start? wd)
  (member? (word-first wd) (list "a" "o" "e" "i" "u")))

;ex4
(define (insert-and lst)
  (se lst))

; ex5
(define (query lst)
  (se (list (first (rest lst))  (first lst)  (se (rest (rest lst))) "?") ))

;ex6 
(define (european-time tm notation)
  (cond
    ((equal? notation 'am) (if (= tm 12)
                               0
                               tm))
    ((equal? notation 'pm) (+ tm 12)) ))

(define (american-time tm)
  (if (>= tm 12)
      (se (list (number->string (- tm 12)) "pm"))
      (se (list (number->string tm) "am"))))

; ex7
(define (describe-time num)
  (cond
    ((<= num 60) (se (list (number->string num) "seconds")))
    ((minute? num)  (se (list (number->string (/ num 60.0)) "minutes")))
    ((hour? num) (se (list (number->string (/ num 3600.0)) "hours")))
    ((day? num) (se (list (number->string (/ num (* 24 60 60.0))) "days")))
    (else (print "Not yet implemented"))
    ))

(define (minute? num)
  (and (> num 60) (<= num (* 60 60))))

(define (hour? num)
  (and (> num (* 60 60)) (<= num (* 24 60 60))))

(define (day? num) ; assume 365.25 days in a year
  (and (> num (* 24 60 60)) (<= num (* 365.25 24 60 60))))

;ex8
(define (superlative adjective wd)
  (se (list (word adjective "est") wd)))
