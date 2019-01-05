#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; В зависимости от b будем выбрана одна из предопределенных функций + или -
; соответственно при вычислении этот код превратится либо в
;(define (a-plus-abs-b a b)
;  (- a b))
;либо
;
;(define (a-plus-abs-b a b)
;  (+ a b))
                          