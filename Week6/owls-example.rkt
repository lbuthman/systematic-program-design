;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname owls-example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Data Definitions==============================

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. each number in the list is an owl's weight in ounces
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;;Functions=====================================

;; ListOfNumber -> Number
;; produce total weight of owls in consumed list
(check-expect (sum-lon empty) 0)
(check-expect (sum-lon (cons 60 empty)) (+ 60 0))
(check-expect (sum-lon (cons 42 (cons 60 empty))) (+ 42 (+ 60 0)))

;(define (sum-lon lon) 0) ;stub

(define (sum-lon lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)
            (sum-lon (rest lon)))]))

;; ListOfNumber -> Natural
;; produce total number of weights in consumed list
(check-expect (count-lon empty) 0)
(check-expect (count-lon (cons 12 empty)) (+ 1 0))
(check-expect (count-lon (cons 35 (cons 12 empty))) (+ 1 (+ 1 0)))

;(define (count-lon long) 0) ;stub

(define (count-lon lon)
  (cond [(empty? lon) 0]
        [else
         (+ 1
            (count-lon (rest lon)))]))