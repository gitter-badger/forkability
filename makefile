VERSION ?= edge

CFLAGS = -c -g -D $(VERSION)

help:
	@echo "  deps        install dependencies"
	@echo "  test        runs tests"
	@echo "  compile     sets up your js files for production"
	@echo "  serve       run the webserver"

deps:
	npm install

test:
	npm test

compile:
	browserify lib/app.js | uglifyjs -c > dist/forkability.$(VERSION).min.js
	browserify lib/app.js > dist/forkability.$(VERSION).js
serve:
	ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd).start'
