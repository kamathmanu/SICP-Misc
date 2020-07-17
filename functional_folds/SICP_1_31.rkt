#lang racket
; SICP Exercise 1.31
; implement product() for repeated summation
; show that factorial can be abstracted using product()
; Iterative implemention

(define (product term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (* acc (term a)))))
  (iter a 1))

(define (inc i)
  (+ i 1))

(define (identity i)
  i)

(define (factorial n)
  (product identity 1 inc n))

; Tests for product
(product identity 3 inc 5)
60

; Tests for factorial
> (map factorial (range 1 6))
'(1 2 6 24 120)
