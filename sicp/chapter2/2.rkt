#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segnment p)
  (car p))

(define (end-segnment p)
  (cdr p))

(make-segment (make-point 1 1) (make-point 1 5))
