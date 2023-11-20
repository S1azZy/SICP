#lang racket
(require rackunit)


(define (pascal row col)
  (cond ((or (< row 1) (< col 1)) 0)
        ((> col row) 0)
        ((or (= col 1) (= col row)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col))))
  )



 (check-equal? (pascal 1 1) 1)
 (check-equal? (pascal 2 2) 1)
 (check-equal? (pascal 3 2) 2)
 (check-equal? (pascal 4 2) 3)
 (check-equal? (pascal 5 2) 4)
 (check-equal? (pascal 5 3) 6)
