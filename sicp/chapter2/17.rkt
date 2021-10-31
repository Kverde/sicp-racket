#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (next-nil? list)
  (null? (cdr list)))

(check-equal? (next-nil? (list 1)) #t)
(check-equal? (next-nil? (list 1 2)) #f)

(define (last-pair list)
  (if (next-nil? list)
      (car list)
      (last-pair (cdr list))))

(check-equal? (last-pair (list 5 1 6)) 6)
(check-equal? (last-pair (list 4)) 4)
