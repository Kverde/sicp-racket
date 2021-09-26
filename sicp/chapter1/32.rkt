#lang sicp

(#%require rackunit)

(define (identity x) x)

; рекурсивный вариант

(define (accumulate1 combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate1 combiner null-value term (next a) next b))))

(define (sum1 term a next b)
  (accumulate1 + 0 term a next b))

(define (product1 term a next b)
  (accumulate1 * 1 term a next b))

(check-equal? (sum1 identity 1 inc 10) 55)
(check-equal? (product1 identity 1 inc 5) 120)

; итеративный вариант

(define (accumulate2 combiner null-value term a next b)
  (define (iter acc a)
      (if (> a b)
          acc
          (iter (combiner acc (term a)) (next a))))
  (iter null-value a))

(define (sum2 term a next b)
  (accumulate2 + 0 term a next b))

(define (product2 term a next b)
  (accumulate2 * 1 term a next b))

(check-equal? (sum2 identity 1 inc 10) 55)
(check-equal? (product2 identity 1 inc 5) 120)