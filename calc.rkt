#!racket
(display (number->string id))
(display ": ")
;; print as float using real->double-flonum then display
(display (real->double-flonum value))
(newline))

(define (repl history)
(when prompt?
(display "> "))
(flush-output)
(let ([line (read-line)])
(if (eof-object? line)
(void)
(if (string=? line "quit")
(void)
(let ([eval-res (evaluate-line line history)])
(match eval-res
[('err msg)
(when prompt?
(display "Error: "))
(displayln (string-append "Error: " "Invalid Expression"))
(repl history)]
[('ok val)
;; add to history (cons) and print with id
(let ([new-history (cons val history)]
[id (+ 1 (length history))])
(when prompt? (void))
(print-result id val)
(repl new-history))]))))))

;; Batch-mode variant: no prompts, only print results or errors
(define (batch-loop history)
(let loop ([hist history])
(let ([line (read-line)])
(if (eof-object? line)
(void)
(if (string=? line "quit")
(void)
(let ([res (evaluate-line line hist)])
(match res
[('err msg) (displayln (string-append "Error: " "Invalid Expression")) (loop hist)]
[('ok val)
(let ([new-hist (cons val hist)] [id (+ 1 (length hist))])
(print-result id val)
(loop new-hist))])))))))

;; Entry point
(define (main)
(if prompt?
(repl '())
(batch-loop '())))

;; Only run main when file executed as program
(when (equal? (vector-ref (current-command-line-arguments) 0) (vector-ref (current-command-line-arguments) 0))
(main))
