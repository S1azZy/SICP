#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; В отличии от особой формы if есть различие. Перед вычислением должны быть вычислены все параметры функции
; если в качестве одного из параметров выступает рекурсивная функция, то программа уйдет в беконечную рекурсию. 