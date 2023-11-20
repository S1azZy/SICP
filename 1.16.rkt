#lang racket
(require rackunit)

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))


(define (fast-expt b n) (iter b n 1))

(define (iter b n a)
   (cond ((= n 0) a)
         ((even? n) (iter (square b) (/ n 2) a))
         (else (iter b (- n 1) (* a b))))
  )


(check-equal? (fast-expt 1 1) 1)
(check-equal? (fast-expt 1 25) 1)
(check-equal? (fast-expt 3 5) 243)
(check-equal? (fast-expt 5 27) 7450580596923828125)



;; (5 27 1)
;; (5 26 5)
;; (25 13 5)
;; (25 12 125)
;; (625 6 125)
;; (390625 3 125)
;; (390625 2 48828125)
;; (152587890625 1 48828125)