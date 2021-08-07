#lang sicp

(#%require rackunit)

(define (square a) (* a a))

(define (sum-square a b) (+ (square a) (square b)))

(define (sum-square-max a b c)
  (cond
    ((<= a (min b c)) (sum-square b c))
    ((<= b (min a c)) (sum-square a c))
    (else (sum-square a b))
    ))

(check-equal? (sum-square-max 1 2 3) 13)
(check-equal? (sum-square-max 3 2 1) 13)
(check-equal? (sum-square-max 1 3 2) 13)
(check-equal? (sum-square-max 2 3 1) 13)
(check-equal? (sum-square-max 1 1 1) 2)

