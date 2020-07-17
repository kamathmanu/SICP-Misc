#lang racket
; SICP 1.33: Generalizing accumulate to "filter" on the terms to be combined.
; It generalizes accumulae by using a predicate to check if the value being accumulated
; fits a given predicate

(define ((filter-accumulate predicate combiner null-value term a next b))
  (define (iter a acc)
    (cond (a > b)
        acc
        ((predicate a)(iter (next a) (combiner (term a) acc))) ; only accumulate if a satisfies the predicate
        (else (iter (next a) acc))))
    (iter a null-value))

; Haven't tested this but pretty sure it should work. Honestly the big idea is the
; process of generalizing from sum() in 1.30 to filter-accumulate in 1.33.