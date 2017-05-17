;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-strings-example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;;CONSTANTS=================================================
(define TEXT-SIZE 20)
(define TEXT-COLOR "black")
(define BLANK (text "" TEXT-SIZE TEXT-COLOR))


;;DATA DEFINITIONS==========================================

;; ListOfString is one of:
;;  - empty
;;  - (cons Letter ListOfString)
;; interp. a list of singles
(define LOS0 empty)
(define LOS1 (cons "a" empty))
(define LOS2 (cons "a" (cons "z" empty)))
#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))

;;FUNCTIONS=================================================

;; ListOfString -> Image
;; layout strings vertically in alphabetic order
(check-expect (arrange-string (cons "a" (cons "b" (cons "c" empty))))
              (above/align "left"
                           (text "a" TEXT-SIZE TEXT-COLOR)
                           (text "b" TEXT-SIZE TEXT-COLOR)
                           (text "c" TEXT-SIZE TEXT-COLOR)
                           BLANK))
(check-expect (arrange-string (cons "zebra" (cons "bravo" (cons "django" empty))))
              (above/align "left"
                           (text "bravo" TEXT-SIZE TEXT-COLOR)
                           (text "django" TEXT-SIZE TEXT-COLOR)
                           (text "zebra" TEXT-SIZE TEXT-COLOR)
                           BLANK))

;(define (arrange-string los) BLANK)

(define (arrange-string los)
  (layout-strings (sort-strings los)))

;; ListOfStrings -> ListOfStrings
;; sort ListOfStrings in alphabetic order
(check-expect (sort-strings empty) empty)
(check-expect (sort-strings (cons "a" (cons "b" (cons "c" empty))))
              (cons "a" (cons "b" (cons "c" empty))))
(check-expect (sort-strings (cons "zebra" (cons "bravo" (cons "django" empty))))
              (cons "bravo" (cons "django" (cons "zebra" empty))))

;(define (sort-strings los) los)

(define (sort-strings los)
  (cond [(empty? los) empty]
        [else
         (insert (first los)
                 (sort-strings (rest los)))]))

;; String ListOfStrings -> ListOfStrings
;; produce new list, sorted alphabetically
(check-expect (insert "z" empty) (cons "z" empty))
(check-expect (insert "z" (cons "a" (cons "b" empty))) (cons "a" (cons "b" (cons "z" empty))))
(check-expect (insert "a" (cons "b" (cons "z" empty))) (cons "a" (cons "b" (cons "z" empty))))
(check-expect (insert "b" (cons "a" (cons "z" empty))) (cons "a" (cons "b" (cons "z" empty))))

;(define (insert str los) los) ;stub

(define (insert str los)
  (cond [(empty? los) (cons str empty)]
        [else
         (if (string>=? str (first los))
             (cons (first los) (insert str (rest los)))
             (cons str los))]))

;; ListOfString -> Image
;; place images above each other in order of list
(check-expect (layout-strings empty) BLANK)
(check-expect (layout-strings (cons "zebra" (cons "bravo" (cons "django" empty))))
              (above/align "left"
                           (text "zebra" TEXT-SIZE TEXT-COLOR)
                           (text "bravo" TEXT-SIZE TEXT-COLOR)
                           (text "django" TEXT-SIZE TEXT-COLOR)
                           BLANK))        

;(define (layout-strings los) BLANK)

(define (layout-strings los)
  (cond [(empty? los) BLANK]
        [else
         (above/align "left"
                      (text (first los) TEXT-SIZE TEXT-COLOR)
                      (layout-strings (rest los)))]))