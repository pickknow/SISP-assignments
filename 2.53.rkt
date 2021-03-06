#lang sicp
(#%require sicp-pict)
(#%require "lib/painter.rkt")
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
;(a b c)
(list (list `geo))
;((geo))
(car `((x1 x2) (y1 y2)))
;(x1 x2)
(cadr `((x1 x2) (y1 y2)))
;(y1 y2)
(pair? (car `(a short list)))
;#f
(memq `red `((red shoes) (blue socks)))
(memq `red `(red shoes blue))