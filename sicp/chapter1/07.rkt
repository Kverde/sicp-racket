#lang sicp

(#%require rackunit)

(define eps 0.0001)

(define (impruve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? last-guess guess)
  (< (abs (- guess last-guess)) eps))

(define (sqrt-iter last-guess guess x)
  (if (good-enough? last-guess guess)
      guess
      (sqrt-iter guess
                 (impruve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 5.0 1.0 x))

(check-= (sqrt 9) 3 eps)
(check-= (sqrt 0.000001) 0.001 eps)
