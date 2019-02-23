#lang racket
(require rackunit)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.0001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(check-within (sqrt 9) 3 0.0001)
(check-within (sqrt 25) 5 0.0001)
(check-within (sqrt 1) 1 0.0001)
(check-within (sqrt 100) 10 0.0001)