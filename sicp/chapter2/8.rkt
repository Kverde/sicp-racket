#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (lower-bound b))
                 (- (upper-bound a) (upper-bound b))
                 ))
(define t1 (make-interval 4 9))
(define t2 (make-interval 2 3))
(define r (sub-interval t1 t2))

(check-equal? (lower-bound r) 2)
(check-equal? (upper-bound r) 6)