#lang racket
;
(require test-engine/racket-tests)

; 11 Design by Composition
;  note: know when to design several functions,
;  and how to compose these functions into one program  
; 

(cons 1 (cons 2 (cons 3 '())))
(list 1 2 3)
;
(cons (cons 1 (cons 2 '()))
      (cons (cons 2 '())
            '()))
(list (list 1 2) (list 2))
;
; 11.2 Composing Functions 
;  note: 1. design one function per task 
;           - formulate auxiliary function definitions 
;             for each dependency between quantities in the problem
;
;        2. **design one template** per data definition  
;           - formulate auxiliary function definitions 
;             when one data definition points to a second data definition  
;
;
;  maintain **a Wish List of function headers** to complete a program  
;      - wirte down complete function headers ensure to test those portions of the program 
;      - before we put a function on the wish list, we should check whether something like 
;      the function already exists in the langage's library 
;      - 从原理出发来解决问题，  而不是 简单模仿 => 产生复利效果   
;
;  
;    11.3 Auxiliary Functions that Recur 
;   in the definition step, create a full-fledged definition from a template 
;      - combine the values of the template's sub-expressions into the final answer 
; 
;   Problem - design a function that sorts a list of reals  
;
;    List-of-numbers  -> List-of-numbers 
;    produces a sorted version of alon 
;(define (sort> alon) alon)
(check-expect (sort> '()) '())
(check-expect (sort> (list 3 2 1)) (list 3 2 1))
(check-expect (sort> (list 12 20 -5)) (list 20 12 -5))
;
;  translate the data definition into a function template 
(define (sort> alon) 
  (cond 
    [(empty? alon) '()]
    [else (insert (first alon) (sort> (rest alon)) )]))
; need to design an auxiliary function here - to insert some value in a sorted list
;  - the composition of values must process an element from 
;  a self-referential data definition - a list
;
; number list-of-numbers -> list-of-numbers 
; insert n into the sorted list numbers alon
;(define (insert n alon) alon)

(check-expect (insert 5 '()) (list 5))
(check-expect (insert 5 (list 6)) (list 6 5))
(check-expect (insert 5 (list 4)) (list 5 4))
(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))

(define (insert n alon)
  (cond 
    [(empty? alon) (list n)]
    [else ( if (>= n (first alon))
               (cons n alon)
               (cons (first alon) (insert n (rest alon))))]))
;
; note: design functions for tests
;       - formulating tests with check-satisfied 
(check-satisfied (sort> '()) sorted>?)
(check-satisfied (sort> (list 12 -5 20)) sorted>?)
; 
(define (sorted>? l)
  (cond
    [(empty? (rest l)) #true]
    [else (and (<= (first l) (second l)) (sorted>? (rest l)))]))

(test)

; TODO - Exercise 188 