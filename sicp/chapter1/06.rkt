#lang sicp

(#%require rackunit)

#|review: ignore|#

(define eps 0.0001)

(define (impruve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) eps))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (impruve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(check-= (sqrt 9) 3 eps)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(check-equal? (new-if (= 2 3) 0 5) 5)
(check-equal? (new-if (= 1 1) 0 5) 0)

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter2 (impruve guess x)
                 x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

; (sqrt2 9)

(sqrt 0.000001)
