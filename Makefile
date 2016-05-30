# Decided to slim the image down and do all the Racket work locally pre-image build,
# rather than have EVERY BUILD download/install Racket, Frog, etc. This was making
# the image something like 750MB, which is way too large for this site.
#
# This Makefile assumes Racket is installed, runs Frog, and builds the `build/` file.

BUILD_DIR=build

build:
	[ -d $(BUILD_DIR) ] || mkdir $(BUILD_DIR)
	raco frog -b
	cp -R static/* build/


clean:
	rm -rf $(BUILD_DIR)
