#lang racket
(require rackunit)

(define (frec n)
  (cond ((< n 3) n)
        (else (+
               (frec (- n 1))
               (frec (- n 2))
               (frec (- n 3))
               )
              )
        )
  )



(check-equal? (frec 0) 0)
(check-equal? (frec 3) 3)
(check-equal? (frec 10) 230)
(check-equal? (frec 20) 101902)

(define (frec-iter n)
  (define (iter x y z count)
    (if (= count 0)
        z
        (iter y z (+ x y z) (- count 1))))
    (if (< n 3)
        n 
        (iter 1 2 3 (- n 3)))
  )


(check-equal? (frec 10) (frec-iter 10))