#lang sicp

(#%require rackunit)

#|review: ignore|#

; (check-equal? 2 2)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define pair (cons 1 2))

(check-equal?  (car pair) 1)
(check-equal?  (cdr pair) 2)