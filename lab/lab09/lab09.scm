(define (over-or-under num1 num2)
'YOUR-CODE-HERE
(cond
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    ((> num1 num2) 1)
    )
)

(define (make-adder num) 
    (lambda (inc) (+ inc num)))

(define (composed f g) 'YOUR-CODE-HERE
    (lambda (x) (f (g x))))

(define (repeat f n) 'YOUR-CODE-HERE
    (lambda (x) (if (> n 0) ((repeat f (- n 1)) (f x)) x)))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))