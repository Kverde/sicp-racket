#lang sicp

(#%require rackunit)

; рекурсивный процесс
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (f1 (- n 2))
         (f1 (- n 3))
         )
      )
  )

(check-equal? (f1 0) 0)
(check-equal? (f1 1) 1)
(check-equal? (f1 2) 2)
(check-equal? (f1 3) 3)
(check-equal? (f1 4) 6)
(check-equal? (f1 5) 11)

; итеративный процесс
(define (f2 n)
  (define (iter n1 n2 n3 i)
    (if (= i n)
        n3
        (iter n2 n3 (+ n1 n2 n3) (+ i 1))))
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 2)
        (else (iter 0 1 2 2))))


(check-equal? (f2 0) 0)
(check-equal? (f2 1) 1)
(check-equal? (f2 2) 2)
(check-equal? (f2 3) 3)
(check-equal? (f2 4) 6)
(check-equal? (f2 5) 11)

  