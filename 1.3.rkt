#lang racket
(require rackunit)

(define (sum-of-squares m n) (+ (* m m) (* n n)))

(define (f x y z) (cond ((< x y z) (sum-of-squares y z))
                        ((< y x z) (sum-of-squares x z))
                        ((< z x y) (sum-of-squares x y))
                        (else (sum-of-squares y z))
                        )
                   )


(check-equal? (f 1 1 1) 2)
(check-equal? (f 1 2 3) 13)
(check-equal? (f 0 0 0) 0)
(check-equal? (f 0 -1 1) 1)
(check-equal? (f 1 2 2) 8)