# Just delegates to the racket script in builder/

all: clean build prod preview

prod:
	racket tools/page-scrubbers/productionize.rkt

push:
	racket builder/builder.rkt --push

build: 
	racket builder/builder.rkt --build

preview:
	racket builder/builder.rkt --preview

clean:
	racket builder/builder.rkt --clean
