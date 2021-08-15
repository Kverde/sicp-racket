#lang sicp

(#%require rackunit)

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))

(check-equal? (mul 22 0) 0)
(check-equal? (mul 0 22) 0)
(check-equal? (mul 1 5) 5)
(check-equal? (mul 5 1) 5)
(check-equal? (mul 9 6) 54)

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





