#lang sicp

(#%require rackunit)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
    (iter a 0))

(define (identity x) x)

(sum identity 1 inc 10)
(sum2 identity 1 inc 10)