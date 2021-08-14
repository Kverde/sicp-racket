#lang sicp

(#%require rackunit)

(define (pascal r c)
  (cond ((= r c 1) 1)
        ((= r -1) 0)
        (else (+ (pascal (- r 1) (- c 1))
                 (pascal (- r 1) c)
                 )
              )
        )
  )



; 1
(check-equal? (pascal 1 1) 1)

; 1 1
(check-equal? (pascal 2 1) 1)
(check-equal? (pascal 2 2) 1)

; 1 2 1
(check-equal? (pascal 3 1) 1)
(check-equal? (pascal 3 2) 2)
(check-equal? (pascal 3 3) 1)

; 1 3 3 1
(check-equal? (pascal 4 1) 1)
(check-equal? (pascal 4 2) 3)
(check-equal? (pascal 4 3) 3)
(check-equal? (pascal 4 4) 1)

; 1 4 6 4 1
(check-equal? (pascal 5 1) 1)
(check-equal? (pascal 5 2) 4)
(check-equal? (pascal 5 3) 6)
(check-equal? (pascal 5 4) 4)
(check-equal? (pascal 5 5) 1)
