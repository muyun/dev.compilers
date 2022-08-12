#lang racket
;  an example to illustrate that how code is designed systematically  
;  Fllowing composition.rkt  
;
; Exercise 188. Design a program that sorts lists of emails by date 
;
; 1) Data definition for the emails
(define-struct email [from date message])
; An email message is a structure:
;   (make-email String Number String)
; interpretation (make-email f d m) represents text m
; send by f, d seconds after the beginning of time 
;
; lists of emails 
; a list-of-emails is one of:
;    - '()
;    - (cons (make-email String Number String) list-of-emails)
;

;  check the self-referential data definitions 
'()
(list (make-email "sara" 10 "simon") '())
(list (make-email "alex" 20 "simon") (make-email "sara" 10 "simon") '())

;   2) write the function signature, purpose, and header
;   list-of-emails -> list-of-emails     
;   sorts list of emails by date in descending order 
(define (sort-email> loe) loe)
;  
;   3) illustrate the signature and the purpose with some functional examples
(require test-engine/racket-tests)
(check-expect (sort-email '()) '())
(check-expect (sort-email 
               (list (make-email "sara" 10 "simon") (make-email "alex" 20 "simon")))
              (list (make-email "alex" 20 "simon") (make-email "sara" 10 "simon")))
;
;   4) write the template - function's body
;     understand what are the givens and what we need to compute

;   5) coding 
;      - replace the function body with an expression 
(define (sort-email loe) 
  (cond 
    [(empty? loe) '()]
    [else 
     (insert-email (first loe) (sort-email (rest loe)))]))
;
;    list-of-emails  -> list-of-emails 
;    inserts email e into (sort-email> list-of-emails)
(define (insert-email> e loe) loe)
(check-expect 
 (insert-email (make-email "simon" 10 "sara") '())
 (list (make-email "simon" 10 "sara")))

(check-expect 
 (insert-email (make-email "simon" 10 "sara")
               (list (make-email "sara" 20 "alex") (make-email "alex" 4 "simon")))
 (list (make-email "sara" 20 "alex")
       (make-email "simon" 10 "sara")
       (make-email "alex" 4 "simon")))
;
(define (insert-email e loe) 
  (cond 
    [(empty? loe) (cons e '())]
    [else 
     (if (email> e (first loe)) (cons e loe)
         (cons (first loe) (insert-email e (rest loe))))]))
;
; email -> boolean
;   determines if one emails' data is higher than the other's
;(define (email e1 e2) #true)
(check-expect (email> (make-email "sara" 20 "alex") (make-email "sam" 10 "sara")) #true)
(check-expect
 (email>
  (make-email "sara" 10 "alex") (make-email "sam" 20 "sara")) #false)
;
(define (email> e1 e2) 
  (cond 
    [(and (email? e1) (email? e2))
     (> (email-date e1) (email-date e2))]
    [else
     (error "e1 and e2 must be (make-email String Number String")]))