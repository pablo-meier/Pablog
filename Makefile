# Assumes you have the npm program 'http-server' to simple serve

BUILD_DIR=build
BT=./fleaswallow

serve: build
	http-server $(BUILD_DIR)

publish: build
	./tools/push_site.sh

.PHONY: build
build:
	[ -d $(BUILD_DIR) ] || mkdir $(BUILD_DIR)
	$(BT) -b

clean:
	rm -rf $(BUILD_DIR)
