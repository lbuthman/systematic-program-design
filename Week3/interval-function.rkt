;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname interval-function) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; Data definitions:

;; SeatNum is a Natural[1,32]
;; Interp: Seats in a row where 1 and 32 are aisle seats
(define SN1 1)
(define SN2 12)
(define SN3 32)

#;
(define (fn-for-seat-num sn)
  (... sn))

;; Template rules used
;;  - atomic non-distinct: Natural[1,32]

;; Functions:

;; SeatNum -> Boolean
;; produce is given seat number is on the aisle
(check-expect (aisle? 1) true)
(check-expect (aisle? 11) false)
(check-expect (aisle? 32) true)

;(define (aisle? sn) false)

;<use template from seat-num>
(define (aisle? sn)
  (or (= sn 1)
      (= sn 32)))
