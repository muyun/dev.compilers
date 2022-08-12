#lang racket
;
(require test-engine/racket-tests)
; 1. mixed data 
;     - compose fixed number of pieces of data with a structure  
;
; ch2 - arbitrarily large data 
; 
; 2. **self-referential data definitions**  -> information of arbitrary size 
;       - deal with **an undermined number of pieces of information** 
;       - finite but arbitrary size data  
;       - a new way of formulating data definitions  
;       - a linked list 
;     
; #  9 Designing with Self-Referential Data Definitions 
;
;  Problem: determine whether "Flatt" is on the list of  cell phone contacts
;
;  1) problem analysis -> data definition 
;       - develop a data representation for the information 
;       - create examples for specific items of informaton and interpret data as information
;       - identify self-references  
;
;    A list-of-names is one of:  <- represent the list of names
;       - '() 
;       - (cons String list-of-names) 
;       interpretation a list of contacts, by last name
;
; check the validity of self-referential data definitions
'()
(cons "Findler" '())
(cons "Flatt" (cons "Findler" '())) ; can generate increasingly larger

;  2) header  -> signature; purpose; dummy definition
;       - write a signature using defined names
;       - formulate a concise purpose statemnt
;       - create a dummy function that produces a constant value from the specified range
;
;    list-of-names -> Boolean    <- signature
;    determines whether 'Flatt' is on a-list-of-names <- **what the function computes**
;(define (contains-flatt? a-list-of-names)  #false)
;
;  3) example -> examples and tests 
;       - work through several examples, at least one per clause in the data definition 
;       - formulate tests that cover the entire function definition   
;
(check-expect (contains-flatt? '()) #false)
(check-expect (contains-flatt? (cons "Findler" '())) #false)
(check-expect (contains-flatt? (cons "Flatt" (cons "Findler" '()))) #true)

;  4)  template -> function template 
;       - translate the data definition into a template 
;       - one cond clause per data clause  
;       - **design a function template that matches the data definition**  
;       - the purpose of a template is to express the data definition as a function layout 
;       
;
;(define (contains-flatt? alon)
;  (cond 
;    [(empty? alon) ... ]
;    [(cons? alon) ... ]))
;
;  5)  definition  -> full-fledged definition 
;       - progiramming task proper  
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [else
     ( or
       (string=? (first alon) "Flatt")
       (contains-flatt? (rest alon))) ]))

;  6)  test  -> validated tests 
;        - turn all examples into tests
(test)