#lang racket

; Define global environment to store variables\
(define global-env (make-hash))

; Helper function to look up variable value in the environment\
(define (lookup-variable var env)
  (if (hash-has-key? env var)
      (hash-ref env var)
      (error "Undefined variable" var)))

; Helper function to update or add variable in the environment\
(define (update-env var value env)
  (hash-set! env var value)
  value)

; Arithmetic operations
(define (calculator-eval expr)
  (cond 
    ; Number literal
    ((number? expr) expr)
    
    ; Variable lookup
    ((symbol? expr) 
     (lookup-variable expr global-env))
    
    ; Assignment
    ((and (list? expr) (eq? (car expr) '=))
     (let ((var (cadr expr))
           (value (calculator-eval (caddr expr))))
       (update-env var value global-env)
       value))
    
    ; Basic arithmetic operations
    ((list? expr)
     (let ((op (car expr))
           (args (map calculator-eval (cdr expr))))
       (case op
         ((+) (apply + args))
         ((-) (apply - args))
         ((*) (apply * args))
         ((/) 
          (if (or (null? args) 
                  (and (= (length args) 2) 
                       (= (cadr args) 0)))
              (error "Division by zero")
              (apply / args)))
         (else (error "Unknown operation" op)))))
    
    ; If none of the cases match, it's an invalid expression
    (else (error "Invalid expression" expr))))

; Test cases
(define (run-tests)
  (display "Running Calculator Tests\\n")
  
  ; Basic arithmetic tests
  (display "Addition Test: ")
  (display (calculator-eval '(+ 2 3)))
  (newline)
  
  (display "Subtraction Test: ")
  (display (calculator-eval '(- 5 2)))
  (newline)
  
  (display "Multiplication Test: ")
  (display (calculator-eval '(* 4 3)))
  (newline)
  
  ; Variable assignment and usage tests
  (display "Variable Assignment Test (x = 10): ")
  (calculator-eval '(= x 10)) ; Assign x = 10
  (display (calculator-eval 'x)) ; Display x's value
  (newline)
  
  ; Complex expression test
  (display "Complex Expression Test: (+ (* 2 3) (- 5 1)) = ")
  (display (calculator-eval '(+ (* 2 3) (- 5 1))))
  (newline)
  
  ; Division test
  (display "Division Test: (/ 10 2) = ")
  (display (calculator-eval '(/ 10 2)))
  (newline)
  
  ; Division by zero test (should raise an error)
  (display "Division by Zero Test: ")
  (with-handlers 
      ([exn:fail? 
        (lambda (exn) 
          (display "Division by zero error caught")
          (newline))])
    (calculator-eval '(/ 10 0))) ; This will raise an error
  (newline)

  ; Additional test for variable assignment and use
  (display "New Variable Assignment Test (y = 3 + 7): ")
  (calculator-eval '(= y (+ 3 7))) ; Assign y = 3 + 7
  (display (calculator-eval 'y)) ; Display y's value
  (newline)
  
  (display "All tests completed\\n"))

; Run the tests
(run-tests)