#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define t (make-interval 2 5))
(check-equal? (lower-bound t) 2)
(check-equal? (upper-bound t) 5)