#lang racket/base

(require racket/file
         racket/system)

;; A quick hack to consolidate + minify requests to external rendering resources,
;; namely, the JS and CSS. Dynamically finds all such resources, puts them into
;; a single file, and runs the YUI compressor on them. We then replace all fetches
;; for resources with our new master file.
;;
;; Most of this is because mobile browsers suffer hard for every such file that is
;; required to render the page, since the very act of making a request often takes
;; 1 or 2 thirds of a second.
;;
;; More can be found in the talks of Google Performance Engineer Ilya Grigorik
;; http://www.igvita.com/
;;
;; It's, uh, major overkill to do this for a simple static blog, but eh, it's fun.

(define-struct request-files (css js))
(define css-pregexp (pregexp "<link rel=\"stylesheet\" type=\"text/css\" href=\"([^\"]+)\""))
(define js-pregexp (pregexp "<script type=\"text/javascript\" src=\"([^\"]+)\""))
(define build-dir (build-path "build"))
(define source-dir (build-path "static"))
(define *make-backups?* #f)

;; productionize : Path
(define (productionize template-file)

  ;; scan the template file for link or script, return a list of files for both.
  (define lists-from-template (scan-template-file template-file))

  ;; make the new minified of each, place in css/ js/ directories
  (minify/compact (request-files-css lists-from-template) "css")
  (minify/compact (request-files-js lists-from-template) "js")
  
  ;; scan the of output-dir and replace each HTML file to point to the new one.
  (modify-html lists-from-template)
  (void))


(define (scan-template-file file)
  (call-with-input-file
    file
    (λ (input-port)
      (define (reader css js)
        (define (extract-filename regex str) (string-append (path->string build-dir) (cadr (regexp-match regex str))))
        (let ([read-item (read-line input-port)])
          (cond
            [(eof-object? read-item) (make-request-files (reverse css) (reverse js))]
            [(regexp-match? css-pregexp read-item)
             (define css-filename (extract-filename css-pregexp read-item))
             (reader (cons css-filename css) js)]
            [(regexp-match? js-pregexp read-item)
             (define js-filename (extract-filename js-pregexp read-item))
             (reader css (cons js-filename js))]
            [else (reader css js)])))
      (reader '() '()))))

(define (minify/compact filenames ext)
  (printf "minify/compact called with ~a to ~a~n" filenames ext)
  (define (make-echoer out)
    (λ (filename)
      (define (echo in)
        (let ([item (read-line in)])
          (if (eof-object? item) 
              (void)
              (begin (display item out) (newline out) (echo in)))))
      (call-with-input-file filename echo)))
  
  (define temp-no-minify (path->string (make-temporary-file)))
  (printf "Consolidated filenames going to ~a~n" temp-no-minify)
  (call-with-output-file
      temp-no-minify
    (λ (out)
      (map (make-echoer out) filenames))
    #:mode 'text #:exists 'append)
  
  (define new-file-minified (build-path build-dir ext (format "morepaul.min.~a" ext)))
  (define yui-command (format "java -jar tools/yuicompressor-2.4.8.jar --type ~v -o ~a ~a" ext new-file-minified temp-no-minify))
  (printf "Calling YUI with command ~v~n" yui-command)
  (system yui-command))


(define (process-html filename request-files)
  (printf "Adding production rules to ~a...~n" filename)
  (call-with-input-file
    filename
    (λ (input-port)
      (let* ([new-filename (if *make-backups?*
                               (string-append (path->string filename) ".bak")
                               filename)])
        (write-out new-filename input-port request-files)))
    #:mode 'text))

(define (write-out outfile-name in files)
  (call-with-output-file
      outfile-name
    (λ (out)
      (define (read-writer js? css?)
        (let ([read-item (read-line in)])
          (cond
            [(eof-object? read-item) (void)]
            [(or (and js? (regexp-match? js-pregexp read-item))
                 (and css? (regexp-match? css-pregexp read-item)))
             (read-writer js? css?)]
            [(regexp-match? js-pregexp read-item)
             (read-writer #t css?)]
            [(regexp-match? css-pregexp read-item)
             (read-writer js? #t)]
            [js? 
             (write-string js-comment-start out)
             (newline out)
             (map (λ (x) (write-bullet x out)) (request-files-js files))
             (write-string "    -->" out)
             (newline out)
             (write-string "    <script type=\"text/javascript\" src=\"/js/morepaul.min.js\"></script>" out)
             (newline out)
             (write-string read-item out)
             (newline)
             (read-writer #f css?)]
            [css? 
             (write-string css-comment-start out)
             (newline out)
             (map (λ (x) (write-bullet x out)) (request-files-css files))
             (write-string "    -->" out)
             (newline out)
;             (write-string "    <style>" out)
             (write-string "    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/morepaul.min.css\">" out)             
;             (write-string "    </style>" out)
             (newline out)
             (write-string read-item out)
             (newline)
             (read-writer js? #f)]
            [else
             (write-string read-item out)
             (newline out)
             (read-writer js? css?)])))
      (read-writer #f #f))
    #:mode 'text #:exists 'replace))

(define (write-bullet str out)
  (write-string (format "                  * ~a" (substring str (string-length (path->string build-dir)))) out)
  (newline out))

(define (modify-html request-files)
  (define (toplevel dir)
    (define (for-each-file x)
      (let ([filename (path->string x)])
        (cond
          [(directory-exists? x) (toplevel x)]
          [(and (>= (string-length filename) 5)
                (string=? ".html" (substring filename (- (string-length filename) 5) (string-length filename))))
           (process-html x request-files)]
          [else (void)])))
    (map (λ (x) (for-each-file (path->complete-path x dir))) (directory-list dir)))
  (toplevel (path->complete-path build-dir (current-directory))))

(define css-comment-start #<<BIG BABY CHIPS
    <!-- Hey friends! If you're looking at this, it means you're delving into the source. What follows
         is pretty ugly - it's inlined CSS, minified, for quick rendering. See this talk by Google performance
         engineer Ilya Grigorik: https://docs.google.com/presentation/d/1IRHyU7_crIiCjl0Gvue0WY3eY_eYvFQvSfwQouW9368/present

         But you may want a human readable version of the CSS. Just query the server for any of the files:

           http://www.morepaul.com/ ->
BIG BABY CHIPS
)

(define js-comment-start #<<SUGAR WOLF
    <!-- Similar to the CSS above, the JS below has been consolidated to keep it to a single request.

         As before, if you want human-readable JS. Just query the server for any of the files:

           http://www.morepaul.com/ ->
SUGAR WOLF
)


;; "Mainline"
(productionize "frog-sources/page-template.html")
