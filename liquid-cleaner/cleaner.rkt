#lang racket

;; Reads any Liquid tags that contain Vimeo or Youtube links and replaces them
;; in the file with proper embed code.
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
;; Writes a file `new-name` with the contents of input port, but if it finds a Liquid tag 
;; with a Vimeo or Youtube embed command, substitutes it with proper embed code.
;; `metadata` in Frog-accepted format, then
;; fills in the rest of the file with `input-file`. Expects `input file` to be
;; advanced past the metadata stages.
(define (write-markdown new-name input-port)
  (call-with-output-file
    new-name
    (λ (output-port)
      (define youtube-regexp (pregexp "\{%\\s+youtube\\s+([^ ]+)\\s+%\}"))
      (define vimeo-regexp (pregexp "\{%\\s+vimeo\\s+([]+)\\s+%\}"))
      (define (read-writer)
        (let ([read-item (read-line input-port)])
          (cond
            [(eof-object? read-item) 'done]
            [(regexp-match? youtube-regexp read-item) #f]
            [(regexp-match? vimeo-regexp read-item) #f]
            [else (begin
                    (write-string read-item output-port)
                    (newline output-port)
                    (read-writer))])))
      (read-writer))
    #:mode 'text))

(let ([files (directory-list)])
  (map process-file (map path->string files))
  (void))
