#lang racket
;
(require 2htdp/batch-io)
(require test-engine/racket-tests)
;  - 10.3 Lists in Lists, Files
;
;  Data representation  
;
;   A list of string (los) is -
;    - '()
;    - (cons String los)
(cons "TTT" '())
(cons "TTT" 
      (cons "" '()))
(cons "TTT" 
      (cons "" 
            (cons "Put up in a place" '())))
(read-file "ttt.txt")
; 
;  A list of words (low) is -
;    - '()
;    - (cons String lows)
(cons "TTT" '())
(cons "TTT" 
      (cons "Put" 
            (cons "up" '())))
(read-words "ttt.txt")
;
;  A list of list of strings (lls) is - 
;    - '() 
;    - (cons String lls) 
(cons "TTT" '())
(cons "TTT" (cons "" '()))
(cons "TTT" (cons "" (cons "Put" '())))
(cons "TTT" 
      (cons "" 
            (cons "Put" 
                  (cons "up" '()))))
(read-words/line "ttt.txt")
;
;
; how many words appear per line 
; 
; list of lists of strings (lls) -> list-of-numbers  
; determines the number of words on each line 
; data examples
(define line0 '())
(define line1 (cons "hello" (cons "world" '())))

(define lls0 '())
(define lls1 (cons line0 (cons line1 '())))

;  the head of desired function
;  (define (words-on-line lls) '())
;
; function example into test cases
(check-expect (words-on-line lls0) '())
(check-expect (words-on-line lls1) (cons 0 (cons 2 '())))
;
;
(define (words-on-line lls) 
  (cond 
    [(empty? lls) '()]
    [else
     ( cons (length (first lls) ); a list of strings 
            (words-on-line (rest lls)) ) ]))


;(test)
;
; file utility
; String -> list-of-numbes  
; counts the words on each line in the given file  
(define (file-statistic file-name)
  (words-on-line (read-words/line file-name)))

(file-statistic "ttt.txt")


