#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (reverse list)
  (define (reverse-iter cur-list rev-list)
    (if (null? cur-list)
        rev-list
        (reverse-iter
         (cdr cur-list)
         (cons (car cur-list) rev-list)))
    )
  (reverse-iter list nil))




(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 1 2)) (list 2 1))
(check-equal? (reverse (list 1 2 3 4)) (list 4 3 2 1))

