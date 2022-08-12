#lang racket
(require 2htdp/image)
;(require (only-in pict show-pict))
(require test-engine/racket-tests)
(require 2htdp/universe)
;
; A Graphical Editor - online editor for plain text
; 
; 5.10 - A Graphical Editor 
;   Data definition 
;   example 1) 
(define-struct editor1 [pre post])
; An Editor is a structure: 
;  (make-editor String String) 
; Interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with the cursor displayed beween s and t 
;
;  example 2)
(define-struct editor2 [txt cur])
; An Editor is a structure:
; (make-editor String Number)
; interpretation (make-editor s n) describes an editor 
; whose text is s with the cursor displayed in s[n]
;
; 10.4 - A Graphical Editor, Revisited 
; example 3)
(define-struct editor3 [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of:
;   - '()
;   - (cons 1String Lo1S) 

(define good (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define lla (cons "l" (cons "l" (cons "a" '()))))
(define all (cons "a" (cons "l" (cons "l" '()))))
; data example
(make-editor3 lla good) ; all good

; Lo1S -> Lo1S 
; reverse the given list
; TODO - finish
(check-expect (rev lla) all)
(define (rev l) 
  (cond
    [(empty? l) '()]
    [else 
     ( add-at-end (rev (rest l)) (first l))]))
;
(define (add-at-end l s) 
  (cond 
    [(empty? l) (cons s '())] ; base case
    [else  ; self-referential case
     (cons (first l) (add-at-end (rest l) s))]))


;-------------------------------------------------
; interactive programs

; physical constants
(define HEIGHT 20)
(define WIDTH 200)
(define FONT-SIZE 16)
(define FONT-COLOR "black")
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

;(define-struct editor [pre post])
; String String -> Editor
; consumes two strings and produces an Editor
; the first string represents text to the left of the cursor,
; the second one represents text to the right of the cursor
(define (create-editor s1 s2)
  (make-editor3
   (reverse (explode s1))
   (explode s2)))

(define (explode s) 
  (map string (string->list s)))

; event handlers 
; Editor -> Image 
; renders an editor as an image of the two texts 
; separated by the cursor  
; TODO  
(define (editor-render e) MT) 

; Editor KeyEvent -> Editor
; deals with a key event, given some editor
(define (editor-kh ed k) 
  (cond [(key=? k "left") editor-lft ed]
        [(key=? k "right") (editor-rgt ed)]
        [(key=? k "\b") (editor-del ed)]
        [(key=? k "\t") ed]
        [(key=? k "\r") ed]
        [(= (string-length k) 1) (editor-ins ed k)]
        [else ed]))

(define (editor-lft ed)
  (cond
    [(<= 1 (length (editor3-pre ed)))
     (make-editor3 (rest (editor3-pre ed))
                   (cons (first (editor3-pre ed)) (editor3-post ed)))]
    [else ed]))

(define (editor-rgt ed)
  (cond
    [(<= 1 (length (editor3-post ed)))
     (make-editor3 (cons (first (editor3-post ed)) (editor3-pre ed))
                   (rest (editor3-post ed)))]
    [else ed]))

(define (editor-del ed)
  (cond
    [(<= 1 (length (editor3-pre ed)))
     (make-editor3 (rest (editor3-pre ed))
                   (editor3-post ed))]
    [else ed]))

(define (editor-ins ed k)
  (make-editor3 (cons k (editor3-pre ed))
                (editor3-post ed)))

; main: String -> Editor
; launches the editor given some initial string
(define (main s)
  (big-bang (create-editor s "")
    [on-key editor-kh]
    [to-draw editor-render]) )
(main "hello")