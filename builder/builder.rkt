#lang racket

(define *build-dir* "build")
(define *static-files* "static")

(define *toad-dir* "builder")
(define *frog-dir* "my-frog")
(define *frog-location* (path->string (build-path *toad-dir* *frog-dir* "frog" "frog.rkt")))


;; BUILD TARGETS
(define (build)
  (prepare)
  (copy-static-files)
  (call-my-frog)
  #f)

(define (preview)
  (if (is-built?)
      (make-syscall (format "racket ~v -vp" *frog-location*))
      (eprintf "Need to build the project first!~n")))

(define (clean)
  (if (has-build-dir?)
      (delete-directory/files *build-dir*)
      (eprintf "Nothing to clean!~n")))

(define (push)
  (cond
    [(is-built?)
     (define dst-server "root@198.74.49.231")
     (define dst-path "/root/www")
     (define dst-string (format "~a:~a" dst-server dst-path))
     (define command (format "rsync --chmod=u=rwx,go=rx -avze 'ssh -p 22' --delete ~a ~a" (string-append *build-dir* "/") dst-string))
     (make-syscall command)]
    [else (eprintf "Must build the project before pushing it to the server~n")]))


;; HELPERS
(define (is-built?)
  (file-exists? (build-path *build-dir* "index.html")))

(define (prepare)
  (if (not (has-build-dir?))
      (make-directory *build-dir*)
      (printf "Build directory is a go!~n")))

(define (copy-static-files)
  (for ([curr (directory-list *static-files* #:build? #t)])
    (ez-move curr *build-dir*)))

;; Cool, Racket can only copy the *contents* of a directory into a fresh directory; you need to
;; make one with the same name yourself. Also, it fails if one of the directories you want to copy into already
;; exists. 
;; nbd
(define (ez-move path dst)
  ;; This next bit is a bit stupid... I want the last value of the path. I can get this with 'split-path',
  ;; but it returns 3 values using the archaic "values" expression, meaning it's not in a list. To access
  ;; that middle value, I have to use "call-with-values".
  (define path-suffix (call-with-values (λ () (split-path path)) (λ (a b c) (path->string b))))
  (define new-dst (string-append dst "/" path-suffix))
  (cond
    [(file-exists? path)
     (copy-file path new-dst #t)]
    [(directory-exists? path) 
     (when (not (directory-exists? new-dst))
       (make-directory new-dst))
     (for ([curr (directory-list path #:build? #t)])
       (ez-move curr new-dst))]
    [else (eprintf "Trying to copy ~v when it's neither a file nor directory~n" path)]))

;; TODO: re-write the `my-frog` to be a library call, rather than a clunky OS subprocess.
(define (call-my-frog)
  (define syscall (format "racket ~v -vb" *frog-location*))
  (make-syscall syscall))

(define (make-syscall str)
  (printf "Calling ~v...~n" str)
  (system str))

(define (has-build-dir?)
  (directory-exists? *build-dir*))

;; mainline
(command-line
  #:program "toad"
  #:once-any
  [("-c" "--clean")
   (""
    "Cleans the working directory")
   (clean)]
  [("-b" "--build")
   (""
    "Builds the project with the mix of static and processed files.")
   (build)]
  [("-p" "--preview")
   (""
    "Runs the frog server")
   (preview)]
  [("-t" "--push")
   (""
    "Pushes the generated site to the external webserver")
   (push)])
