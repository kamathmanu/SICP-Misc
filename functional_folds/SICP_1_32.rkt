#lang racket
; SICP Exercise 1.32:
; generalize sum() and product() to accumulate()
; (accumulate combiner null-value term a next b)

(define ((accumulate combiner null-value term a next b))
  (define (iter a acc)
    (if (a > b)
        acc
        (iter (next a) (combiner (term a) acc))))
    (iter a null-value))


; Utility functios

(define (inc i)
  (+ i 1))

(define (identity i)
  i)

; sum() as a specific case of accumulate()
(define (add m n)
  (+ m n))

(define (sum term a next b)
(accumulate add 0 term a next b))

; product() as a specific case of accumulate()

(define (multiply m n)
  (* m n))

(define (product term a next b)
  (accumulate product 1 term a next b))

; Tests

(sum identity 1 inc 10)
55

(product identity 3 inc 5)
60