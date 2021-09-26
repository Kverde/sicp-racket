#lang sicp

(#%require rackunit)

; ------------------------- prime


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))

;--------------------------

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter acc a)
    (cond ((> a b) acc)
          ((filter a) (iter (combiner acc (term a)) (next a)))
          (else (iter acc (next a)))))
  (iter null-value a))


(define (sum-square-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(check-equal? (sum-square-prime 2 10) 87)
(check-equal? (sum-square-prime 2 12) 208)

; задача b

(define (gcd a b)
  (cond ((= a 0) b)
        ((= b 0) a)
        ((> a b) (gcd (remainder a b) b))
        (else (gcd a (remainder b a)))))

(define (rprime? a b)
  (= (gcd a b) 1))

(define (identity x) x)

(define (product-rprime n)
  (filtered-accumulate (lambda (a) (rprime? a n)) * 1 identity 1 inc n))

(check-equal? (product-rprime 3) 2)
(check-equal? (product-rprime 5) 24)
(check-equal? (product-rprime 6) 5)
