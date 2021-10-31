#lang sicp

(#%require rackunit)

; (check-equal? 2 2)

; point

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; rect

(define (make-rect lt-point rb-point)
  (cons lt-point rb-point))

(define (lt-point rect)
  (car rect))

(define (rb-point rect)
  (cdr rect))

(define (x-distance p1 p2)
  (abs (- (x-point p2) (x-point p1))))

(define (y-distance p1 p2)
  (abs (- (y-point p2) (y-point p1))))

; Представление для прямоугольников с хранение верхнего левого угла и правого нижнего
; подразумевается что стороны прямоугольника паралельны осям координат

(define (rect-area rect)
  (let ([p1 (lt-point rect)]
        [p2 (rb-point rect)])
    (* (x-distance p1 p2) (y-distance p1 p2))))

(define (rect-per rect)
  (let ([p1 (lt-point rect)]
        [p2 (rb-point rect)])
    (+ (* (x-distance p1 p2) 2)
       (* (y-distance p1 p2) 2))))

(define rect1 (make-rect (make-point 1 1) (make-point 4 5)))
(check-equal? (rect-area rect1) 12)
(check-equal? (rect-per rect1) 14)

; Другое представление прямоогульника, хранится координата верхнего левого угла, ширина и высота
; так же подразумевается что стороны прямоугольника параллельны осям координат

(define (make-rect-size w h)
  (cons w h))

(define (make-rect2 p1 w h)
  (cons p1 (make-rect-size w h)))

(define (w-rect rect)
  (car (cdr rect)))

(define (h-rect rect)
  (cdr (cdr rect)))

(define rect2 (make-rect2 (make-point 1 1) 5 8))
(check-equal? (w-rect rect2) 5)
(check-equal? (h-rect rect2) 8)

; интерфейс и использование процедур для нахождения переметра и площади будет полностью совпадать
