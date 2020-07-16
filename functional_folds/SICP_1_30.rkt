#lang racket
; sum for repeated summation

; (define (sum term a next b))
; term : transformation to apply to i e [a,b]
; next : transformation to increment i within the interval

; Recursive

(define (sum-r term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-r term (next a) next b)))) 

; Iterative

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        (result)
        (iter (next a) (+ result (term a))))) ; crucial to understand this
  (iter (a) (0)))