#lang racket
(require rackunit)

(define (sum-of-squares m n) (+ (* m m) (* n n)))

(define (gt_any? x y z) (or (> x y) (> x z)))
(define (get_max x y) (if (> x y) x y))

(define (f x y z) (cond ((gt_any? x y z) (sum-of-squares x (get_max y z)))
                        ((gt_any? y x z) (sum-of-squares y (get_max x z)))
                        ((gt_any? z x y) (sum-of-squares z (get_max y x)))
                        (else (sum-of-squares y z))
                        )
                   )




(check-equal? (f 1 1 1) 2)
(check-equal? (f 1 2 3) 13)
(check-equal? (f 0 0 0) 0)
(check-equal? (f 0 -1 1) 1)
(check-equal? (f 2 2 1) 8)
(check-equal? (f 1 2 2) 8)
