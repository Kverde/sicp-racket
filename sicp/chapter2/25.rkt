#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define x1 (list 1 3 (list 5 7) 9))
(define x2 (list (list 7)))
(define x3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(define r1 (cadr (caddr x1)))
(define r2 (caar x2))
(define r3 (cadr (cadr (cadr (cadr (cadr (cadr x3)))))))

(check-equal? r1 7)
(check-equal? r2 7)
(check-equal? r3 7)