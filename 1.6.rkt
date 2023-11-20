#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (abs x) (if (< x 0) (- x) x))

(define (improve guess x)
  (average guess (/ x guess)))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; В отличии от особой формы if есть различие. Перед вычислением должны быть вычислены все параметры функции
; если в качестве одного из параметров выступает рекурсивная функция, то программа уйдет в беконечную рекурсию. 