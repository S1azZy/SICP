#lang racket
(require rackunit)


(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x) (+ x x))


(define (halve-iter x counter)
  (if (< x 2)
      counter
      (halve-iter (- x 2) (+ counter 1))
  ))

                        

(define (halve x)
  (if
   (or (not (integer? x)) (odd? x))
   (printf "halve: argument must be even integer, given ~a.\n" x)
   ((if (negative? x) - +) (halve-iter (abs x) 0))
  ))


(define (xor x y)
  (or (and x (not y)) 
      (and y (not x))))

(define (mult-iter a b)
  (cond ((= b 1) a)
        ((even? b) (mult-iter (double a) (halve b)))
        ((odd? b) (+ a (mult-iter a (- b 1))))))


(define (mult a b)
  (if (or (zero? b) (zero? a))
         0
        ((if (xor (negative? a) (negative? b)) - +) (mult-iter (abs a) (abs b))
        
  )))