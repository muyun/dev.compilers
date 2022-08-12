#lang racket
; 
; about racket 
;
(string-append "Hello World")

(cos pi)

; cannot display the image to use 2htdp/image directly 
; use imgcat to display img in iterm, and fix the bugs  "add racket/gui/base" in pict
(require 2htdp/image (only-in pict show-pict))
;(require racket/gui/base)

(show-pict (circle 10 "solid" "red"))

(show-pict (overlay (circle 5 "solid" "red")
                    (rectangle 20 20 "solid" "blue")))

(show-pict (place-image (circle 5 "solid" "green")
                        50 80
                        (empty-scene 100 100)))

;
