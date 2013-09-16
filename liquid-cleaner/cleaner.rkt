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
        (write-string (string-append "    Title:" (metadata-title metadata)) output-port)
        (newline output-port)
        (write-string (string-append "    Date:" (metadata-good-date metadata)) output-port)
        (newline output-port)
        (write-string "    Tags: pablolife" output-port)
        (newline output-port)
        (newline output-port)
        (define (read-writer)
          (let ([read-item (read-line input-port)])
            (if (eof-object? read-item)
              'done
              (begin
                (write-string read-item output-port)
                (newline output-port)
                (read-writer)))))
        (read-writer))
    #:mode 'text))

;; fix-date :: metadata -> metadata
;;
;; Fixes the date to use ISO 8601
(define (fix-date meta)
  ;; Blogger uses  "2010-02-15 21:29:00 -08:00"
  (define *blogger-regex* #px"(\\d{4})-(\\d{2})-(\\d{2}) (\\d{2}):(\\d{2}):(\\d{2}) -?\\d{2}:\\d{2}")
  ;; Jekyll uses 2012-12-18 17:22
  (define *jekyll-regex* #px"(\\d{4})-(\\d{2})-(\\d{2}) (\\d{2}):(\\d{2})")
  (define (match-blogger-style? in) (regexp-match? *blogger-regex* in))
  (define (match-jekyll-style? in) (regexp-match? *jekyll-regex* in))
  (define (fix-blogger-style input)
    (let ([matched (regexp-match *blogger-regex* input)])
      (string-append (list-ref matched 1) "-" (list-ref matched 2) "-" (list-ref matched 3) "T"
                     (list-ref matched 4) ":" (list-ref matched 5) ":" (list-ref matched 6))))
  (define (fix-jekyll-style input)
    (let ([matched (regexp-match *jekyll-regex* input)])
      (string-append (list-ref matched 1) "-" (list-ref matched 2) "-" (list-ref matched 3) "T"
                     (list-ref matched 4) ":" (list-ref matched 5) ":00")))
  (let ([bad-date (metadata-bad-date meta)])
    (cond
      [(match-blogger-style? bad-date)
       (struct-copy metadata meta [good-date (fix-blogger-style bad-date)])]
      [(match-jekyll-style? bad-date)
       (struct-copy metadata meta [good-date (fix-jekyll-style bad-date)])]
      [else (error 'fix-date "No match for string \"~a\"" bad-date)])))


;; parse-file :: port -> (or/c Metadata #f)
;; Parses the first few lines, processes the metadata.
(define (parse-metadata file-port filename)
  (define *date-regex* #px"^(time|date):(.*)")
  (define *title-regex* #px"^title:(.*)")
  (define *delimeter-regex* #px"^---")
  (define (helper start-block? accum)
    (let ([read-item (read-line file-port)])
      (cond
        [(and (regexp-match? *delimeter-regex* read-item) start-block?) accum]
        [(regexp-match? *delimeter-regex* read-item) (helper #t accum)]
        [else 
          (cond
            [(regexp-match? *title-regex* read-item) 
             (let ([fetched-title (cadr (regexp-match *title-regex* read-item))])
               (helper start-block? (struct-copy metadata accum [title fetched-title])))]
            [(regexp-match? *date-regex* read-item)
             (let ([fetched-date (caddr (regexp-match *date-regex* read-item))])
               (helper start-block? (struct-copy metadata accum [bad-date fetched-date])))]
            [else (helper start-block? accum)])])))
  ;; Some don't have a date field at all, so we'll just take from the filename.
  (let ([title (regexp-match #px"(\\d+-\\d+-\\d+)-.*" filename)])
    (helper #f (metadata ""
                         (string-append (list-ref title 1) " 12:00")
                         ""))))



(let ([files (directory-list)])
  (map process-file (map path->string files))
  (void))
