#lang racket
;
; TODO - 12.3 Word Games, Composition Illustrated 
; Problem - Given a word, find all words that are made up
;  from the same letters. like "cat" also spells "act"
;
; note: we proceed systematically and start by choosing a data representation
;      for our inputs and outputs 
;

;  1.  problem analysis -> data definition 
;      represent words as strings, and the result as a list of words 
;
;  2.  formulate a signature and purpose statement
;  string -> list-of-strings  
;  find all words that use the same letters as s
;
;   compose two part
;      - rearrangement words 
;      - check in dictionary 
(define (alternative-words s) 
  (list->string (rearrangement (string->list s))))
;(define (arrangements s) s)
;    list-of-strings -> list-of-strings
;     picks out all those Strings that occur in the dictionary
;     TODO - use WordNet  
;(define (in-dictionary los) '())

;
;  3.  example -> examples and tests 
(require test-engine/racket-tests)
;     word representation - strings or list-of-letters?
;(check-member-of (alternative-words "cat") 
;                 (list "act" "cat")
;                 (list "cat" "act"))
;  note: view words as list of letters is better 
;  TODO - TESTS FAILED 
;       - https://github.com/S8A/htdp-exercises/blob/master/ex213.rkt
(check-satisfied (alternative-words "rat")
                 all-words-from-rat?)
; list-of-letters -> Boolean 
(define (all-words-from-rat? w)
  (and (member "rat" w)
       (member "art" w)
       (member "tar" w)))

;  A word is list-of-letters
;    - '() or
;    - (cons 1String word) ; 1String refers to the keyboard letters that make up a String
;    interpretation a word is a list of 1Strings (letters) 

;  A list-of-words is 
;    - '() or 
;    - (cons word list-of-words)
;    interpretation a list-of-words is a list of words 
;
;  word -> list-of-words
;  finds all rearrangements of the letters in word w
(define (rearrangement w) 
  (cond 
    [(empty? w) (list '())]
    [else (insert-everywhere/in-all-words (first w) (rearrangement (rest w)))]))

; 1String, list-of-words -> list-of-words 
;  produces a list like the given one but with character x inserted at 
;  the beginning, between all letters, and at the end of all words of the given list
(define (insert-everywhere/in-all-words x low) 
  (cond 
    [(empty? low)  '()]
    [else 
     (append (insert-everywhere x (first low))
             (insert-everywhere/in-all-words x (rest low)))]))

; 1String word -> list-of-words
; inserts the character x at every position between the characters of the word w
(define (insert-everywhere x w)
  (cond 
    [(empty? w) (list (list x))]
    [else
     (cons (cons x w)
           (prepend-to-each (first w) (insert-everywhere x (rest w))))]))
; 1 String list-of-words -> list-of-words
; inserts the character x at the beginning of each word in the given list
(define (prepend-to-each x low)
  (cond
    [(empty? low) '()]
    [else
     (cons (cons x (first low))
           (prepend-to-each x (rest low)))]))

;
;  string -> word
;  converts s to the chosen word representation 
(check-expect (string->list "") '())
(check-expect (string->list "hello") (list #\h #\e #\l #\l #\o)) ; a character’s code-point number
;(define (string->word s) (string->list s))
;  word -> string
;  converts w to a string 
(check-expect (list->string '()) "")
(check-expect (list->string (list #\h #\e #\l #\l #\o)) "hello")
;(define (word->string w) (list->string w))
(test)