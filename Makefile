.PHONY: build push build-mailout push-mailout

default: build

build:
	docker build -t bravado/debian:stretch .

push: build
	docker push bravado/apache:stretch

test: build
	bash test.sh
