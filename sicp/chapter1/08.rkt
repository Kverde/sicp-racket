#lang sicp

(#%require rackunit)

(define eps 0.0001)

(define (square x)
  (* x x))

(define (impruve guess x)
  (/ (+ (/ x (square guess))
        (* guess 2)
        )
     3))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) eps))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (impruve guess x)
                 x)))

(define (cube-root x)
  (cube-root-iter 2.0 x))

 (check-= (cube-root 27) 3 eps)
 (check-= (cube-root 125) 5 eps)