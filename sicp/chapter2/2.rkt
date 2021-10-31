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

(define seg1 (make-segment (make-point 1 3) (make-point 2 5)))

(check-equal? (x-point (start-segnment seg1)) 1)
(check-equal? (y-point (start-segnment seg1)) 3)
(check-equal? (x-point (end-segnment seg1)) 2)
(check-equal? (y-point (end-segnment seg1)) 5)
