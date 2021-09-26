#lang sicp

(#%require rackunit)

(define (f g)
  (g 2))

(f (lambda (z) (* z (+ z 1))))

(f f)
; методом подстановки можно дойти до вычисления (2 2)
; что приводит к исключению