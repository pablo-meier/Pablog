# Just delegates to the racket script in builder/

all: clean build preview

new:
	racket builder/my-frog/frog/frog.rkt -n "$(t)"

push:
	racket builder/builder.rkt --push

build: 
	node tools/require-optimizer/r.js -o tools/require-optimizer/build.js
	racket builder/builder.rkt --build

preview:
	racket builder/builder.rkt --preview

clean:
	racket builder/builder.rkt --clean
