;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; design your own image

(require 2htdp/image)

(overlay/offset
 (overlay (circle 10 "solid" (color 255 255 110 250))
          (radial-star 20 15 50 "solid" "red")
          (radial-star 10 25 45 "solid" "orange"))
          0 40
          (ellipse 5 100 "solid" "green"))