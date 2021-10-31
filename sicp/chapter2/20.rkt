#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (parity n)
  (remainder n 2))

(check-equal? (parity 3) 1)
(check-equal? (parity 2) 0)

(define (same-parity a b)
  (= (parity a) (parity b)))

(check-equal? (same-parity 1 2) #f)
(check-equal? (same-parity 4 6) #t)

(define (filter list f)
    (cond ((null? list) nil)
          ((f (car list)) (cons (car list) (filter (cdr list) f)))
          (else (filter (cdr list) f)))
    )

                                             
(define (same-parity-list . list)
  (filter list (lambda (n) (same-parity (car list) n))))

(check-equal? (same-parity-list 1 2 3 4 5) (list 1 3 5))
(check-equal? (same-parity-list 2 4 5 1 9 8) (list 2 4 8))