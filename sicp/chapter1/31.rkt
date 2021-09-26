#lang sicp

(#%require rackunit)

(define (identity x) x)

; product с рекурсивным процессом

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; реализация factorial с product с рекурсивыным процессом

(define (factorial n)
  (product identity 1 inc n))

(check-equal? (factorial 0) 1)
(check-equal? (factorial 1) 1)
(check-equal? (factorial 3) 6)
(check-equal? (factorial 4) 24)
(check-equal? (factorial 5) 120)

(define (even? n)
  (= (remainder n 2) 0))

; функция вычесления pi реализованная через product

(define (getp n)
        (define (get-item k)
          (if (even? k)
              (/ (+ k 2.0) (+ k 1))
              (/ (+ k 1.0) (+ k 2))))
        (* (product get-item 1 inc n)
           4))

(getp 1)
(getp 2)
(getp 5)
(getp 10)
(getp 20)
(getp 50)

; product2 с итеративным процессом
; вероятно, нужно ещё значение по умолчанию если 0 элементов
; в последовательности

(define (product2 term a next b)
  (define (iter acc a)
    (if (> a b)
      acc
      (iter (* acc (term a)) (next a))))
  (iter 1 a))

(define (factorial2 n)
  (product2 identity 1 inc n))

(check-equal? (factorial2 0) 1)
(check-equal? (factorial2 1) 1)
(check-equal? (factorial2 3) 6)
(check-equal? (factorial2 4) 24)
(check-equal? (factorial2 5) 120)

