(define (filter-lst fn lst)
  (cond ((null? lst ) nil)
	((fn (car lst)) (append (list (car lst)) (filter-lst fn (cdr lst))))
	(else (filter-lst fn (cdr lst)) ))

)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  (cond ((null? first) second)
	((null? second) first)
	(else(append (list (car first)(car second)) (interleave(cdr first)(cdr second) )) )
    )
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 1) (combiner start (term n))(combiner (term n)(accumulate combiner start (- n 1) term) ))
)


(define (no-repeats lst)
  'YOUR-CODE-HERE
  (cond ((null? lst) nil)
	(else (cons  (car lst) (no-repeats (filter-lst  (lambda (x)(not (= x (car lst)))) (cdr lst))))))

)
