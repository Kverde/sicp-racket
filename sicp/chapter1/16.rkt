#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))
        )
  )

(check-equal? (fast-expt 22 0) 1)
(check-equal? (fast-expt 1 1) 1)
(check-equal? (fast-expt 2 1) 2)
(check-equal? (fast-expt 2 10) 1024)
(check-equal? (fast-expt 3 3) 27)
(check-equal? (fast-expt 3 11) 177147)

(define (double n)
  (* n 2))

(define (fast-expt-iter b n)
  (define (iter acc cur-n)
    (cond ((= cur-n n) acc)
          ((= cur-n 0) (iter b 1))                   
          ((<= (double cur-n) n) (iter (square acc) (double cur-n)))
          (else (iter (* acc b) (+ cur-n 1)))
          )
    )
  (iter 1 0)
  )


(check-equal? (fast-expt-iter 22 0) 1)
(check-equal? (fast-expt-iter 1 1) 1)
(check-equal? (fast-expt-iter 2 1) 2)
(check-equal? (fast-expt-iter 2 2) 4)
(check-equal? (fast-expt-iter 2 5) 32)
(check-equal? (fast-expt-iter 2 6) 64)
(check-equal? (fast-expt-iter 2 10) 1024)
(check-equal? (fast-expt-iter 3 3) 27)
(check-equal? (fast-expt-iter 3 11) 177147)
