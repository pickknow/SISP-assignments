#lang racket
(define the-empty-stream empty-stream)
(define stream-null? stream-empty?)
(define stream-car stream-first)
(define stream-cdr stream-rest)
(define (stream-append s1 s2)
  (if (stream-null? s1)
      s2
      (stream-cons (stream-car s1)
                   (stream-append (stream-cdr s1) s2))))
(define (stream-top s n)
  (if (< n 0)
      (displayln `done)
      (begin
        (displayln (stream-car s))
        (stream-top (stream-cdr s) (- n 1)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (stream-cons (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (integers-starting-from n)
  (stream-cons n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define (pairs s t)
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                t)
    (pairs (stream-cdr s) (stream-cdr t))))

(define a (pairs integers integers))
(stream-ref a 0)
;(stream-top a 10)