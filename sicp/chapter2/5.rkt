#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

(define (pow a b)
  (define (iter r cur-b)
    (if (= cur-b 0)
        r
        (iter (* r a) (dec cur-b))))
  (iter 1 b))

(define (my-div a b)
  (define (iter cur-a r)
    (if (not (= (remainder cur-a b) 0))
        r
        (iter (/ cur-a b) (inc r))))
  (iter a 0))

(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

(define (car p) (my-div p 2))
(define (cdr p) (my-div p 3))

(define p1 (cons 1 2))
(check-equal? (car p1) 1)
(check-equal? (cdr p1) 2)

(define p2 (cons 5 3))
(check-equal? (car p2) 5)
(check-equal? (cdr p2) 3)

(define p3 (cons 0 0))
(check-equal? (car p3) 0)
(check-equal? (cdr p3) 0)

(define p4 (cons 8 8))
(check-equal? (car p4) 8)
(check-equal? (cdr p4) 8)
