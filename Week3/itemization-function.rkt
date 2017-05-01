;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname itemization-function) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Countdown is one of:
;;  - false
;;  - Integer[1, 10]
;;  - "complete"
;; interp.
;;  - false means countdown has not started
;;  - Integer[1, 10] means countdown is running and how many seconds left
;;  - "complete" means countdown is over

(define CD1 false)
(define CD2 10)
(define CD3 1)
(define CD4 "complete")
#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c) (<= 10 c)) (... c)]
        [else (...)]))

#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(number? c) (... c)]
        [else (...)]))

; Template rules used:
;  - one of: 3 cases
;  - atomic distinct: false
;  - atomic non-distinct
;  - atomic distinct: "complete"

;; Function definitions:

;; Countdown -> Image
;; produce nice image of current state countdown
(check-expect (countdown-to-image false) (square 0 "solid" "white"))
(check-expect (countdown-to-image 5) (text (number->string 5) 24 "black"))
(check-expect (countdown-to-image "complete") (text "Happy New Year!!" 24 "red"))

;(define (countdown-to-image cd) (square 0 "solid" "white"))

;<used template from countdown>
(define (countdown-to-image c)
  (cond [(false? c) (square 0 "solid" "white")]
        [(number? c)
         (text (number->string 5) 24 "black")]
        [else (text "Happy New Year!!" 24 "red")]))