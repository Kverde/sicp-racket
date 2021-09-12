#lang sicp

(#%require rackunit)

(define (identity x) x)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(check-equal? (factorial 3) 6)
(check-equal? (factorial 4) 24)
(check-equal? (factorial 5) 120)

(define (even? n)
  (= (remainder n 2) 0))

(deifne (getp n)
        (define (item k)
          (if (even k)
              (/ (* k 2) (- (* k 2) 1))
              (/ (
        (product item 1 inc n))