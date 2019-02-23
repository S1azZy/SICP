#lang racket
(require rackunit)

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+
      (/ x (square guess))
      (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.0001))

(define (square x)
  (* x x))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(check-within (cbrt 27) 3 0.0001)
(check-within (cbrt 125) 5 0.0001)
(check-within (cbrt 1) 1 0.0001)
(check-within (cbrt 1000) 10 0.0001)