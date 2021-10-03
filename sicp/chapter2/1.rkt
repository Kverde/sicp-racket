#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (neg? x)
  (< x 0))

(define (make-rat n d)
  (define g (gcd n d))
  (define sign (if (neg? d)
                   -1
                   1))
  (cons (/ n g sign) (/ d g sign)))

(check-equal? (make-rat 1 2) '(1 . 2) )
(check-equal? (make-rat -1 -2) '(1 . 2) )
(check-equal? (make-rat -1 2) '(-1 . 2) )
(check-equal? (make-rat 1 -2) '(-1 . 2) )