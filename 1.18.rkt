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

(define (mult-iter a x b)
  (cond ((= b 0) x)
        ((even? b) (mult-iter (double a) x (halve b)))
        ((odd? b) (mult-iter a (+ a x) (- b 1)))))


(define (mult a b)
  (if (or (zero? b) (zero? a))
         0
        ((if (xor (negative? a) (negative? b)) - +) (mult-iter (abs a) 0 (abs b))
        
  )))


;;(13 1 11)
;;(13 13 10)
;;(26 13 5)
;;(26 39 4)
;;(52 39 2)
;;(104 39 1)
;;(104 143 0)