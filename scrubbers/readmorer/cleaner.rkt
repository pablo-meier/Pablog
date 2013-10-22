#lang racket

;; Finds the second blank line after the tags list, and adds a '<!-- more -->' so the
;; index pages aren't so huge.
(define (process-file filename)
  (fprintf (current-output-port) "Processing ~a...~n" filename)
  (call-with-input-file
    filename
    (λ (input-port)
      (let* ([new-filename (string-append filename ".bak")])
        (write-markdown new-filename input-port)))
    #:mode 'text))

;; write-markdown :: String * Metadata * Port -> (void)
;;
;; Writes a file `new-name` with the contents of input port, but after the second
;; totally blank line after the tags, inserts a Read More link.
(define (write-markdown new-name input-port)
  (call-with-output-file
    new-name
    (λ (output-port)
      (define blank-line-regexp (pregexp "^\\s*$"))
      (define (read-writer num-times)
        (let ([read-item (read-line input-port)])
          (cond
            [(eof-object? read-item) 'done]
            [(and (regexp-match? blank-line-regexp read-item) 
                  (= num-times 2))
             (begin
               (write-string read-item output-port)
               (newline output-port)
               (write-string "<!-- more -->" output-port)
               (newline output-port)
               (write-string read-item output-port)
               (newline output-port)
               (read-writer (add1 num-times)))]
            [(regexp-match? blank-line-regexp read-item) 
             (begin
               (write-string read-item output-port)
               (newline output-port)
               (read-writer (add1 num-times)))]
            [else (begin
                    (write-string read-item output-port)
                    (newline output-port)
                    (read-writer num-times))])))
      (read-writer 0))
    #:mode 'text))

(let ([files (directory-list)])
  (map process-file (map path->string files))
  (void))
