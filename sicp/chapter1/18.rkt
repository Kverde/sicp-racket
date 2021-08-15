#lang sicp

(#%require rackunit)

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mul-fast a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (mul-fast (double a) (halve b)))
        (else (+ a (mul-fast a (- b 1))))
        )
  )

(check-equal? (mul-fast 22 0) 0)
(check-equal? (mul-fast 0 22) 0)
(check-equal? (mul-fast 1 5) 5)
(check-equal? (mul-fast 5 1) 5)
(check-equal? (mul-fast 9 6) 54)


(define (mul-fast-iter a b)
  (define (iter acc add b-iter)
    (cond ((= b 0) add)
          ((= b-iter 1) (+ acc add))
          ((even? b-iter) (iter (double acc) add (halve b-iter)))
          (else (iter acc (+ add acc) (- b-iter 1)))
        )
   )
  (iter a 0 b)
  )

(check-equal? (mul-fast-iter 22 0) 0)
(check-equal? (mul-fast-iter 0 22) 0)
(check-equal? (mul-fast-iter 1 5) 5)
(check-equal? (mul-fast-iter 5 1) 5)
(check-equal? (mul-fast-iter 5 3) 15)
(check-equal? (mul-fast-iter 5 4) 20)
(check-equal? (mul-fast-iter 123 353) 43419)
(check-equal? (mul-fast-iter 9 6) 54)
(check-equal? (mul-fast-iter 11 6) 66)




