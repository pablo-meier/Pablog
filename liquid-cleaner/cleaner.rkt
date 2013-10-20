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
      (define youtube-regexp (pregexp "\\{%\\s+youtube\\s+[^ ]+v=([^ ]+)\\s+%\\}"))
      (define vimeo-regexp (pregexp "\\{%\\s+vimeo\\s+[^ ]+/(\\d+)\\s+%\\}"))
      (define yt-output-fmt-string "<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/~a\" frameborder=\"0\" allowfullscreen></iframe>")
      (define vm-output-fmt-string "<iframe src=\"//player.vimeo.com/video/~a;byline=0&amp;portrait=0&amp;badge=0\" width=\"500\" height=\"281\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>")
      (define (read-writer)
        (let ([read-item (read-line input-port)])
          (cond
            [(eof-object? read-item) 'done]
            [(regexp-match? youtube-regexp read-item) 
             (begin
               (define video-id (cadr (regexp-match youtube-regexp read-item)))
               (write-string (format yt-output-fmt-string video-id) output-port)
               (newline output-port)
               (read-writer))]
            [(regexp-match? vimeo-regexp read-item) 
             (begin
               (define video-id (cadr (regexp-match vimeo-regexp read-item)))
               (write-string (format vm-output-fmt-string video-id) output-port)
               (newline output-port)
               (read-writer))]
            [else (begin
                    (write-string read-item output-port)
                    (newline output-port)
                    (read-writer))])))
      (read-writer))
    #:mode 'text))

(let ([files (directory-list)])
  (map process-file (map path->string files))
  (void))
