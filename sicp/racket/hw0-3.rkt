#lang racket
(require racket/trace)

(require "str.rkt")

; define
(define (initials sent)
  (if (empty? sent)
      ""
      (se (list (ch-first (first sent))
          (initials (rest sent)))))

  ;(error "Not yet implemented")
)

; “
(define (numbers lst)
  (cond ((empty? lst) "")
        ((number? lst); #t
            (se (list (first lst) (numbers (rest lst)))))
        (else (numbers (rest lst))))
)

(define (number? lst)
  (number? (string->number (first lst))))
