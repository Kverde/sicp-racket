#lang sicp

(#%require rackunit)

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (even? x)
  (= (remainder x 2) 0))

(define (sympson f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (item k)
    (define v (yk k))
    (cond ((= k 0) v)
          ((= k n) v)
          ((even? k) (* 2 v))
          (else (* 4 v))))
  (* (sum item 0 inc n)
     (/ h 3)))

(sympson cube 0 1.0 100)
(sympson cube 0 1.0 1000)
