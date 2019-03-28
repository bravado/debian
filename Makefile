.PHONY: init build push

DOCKER_IMAGE ?= registry.gitlab.com/prosoma/debian

default: build

init:
	$(eval GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD))

build: init
	docker build -t ${DOCKER_IMAGE}:${GIT_BRANCH} .

push: build
	docker push ${DOCKER_IMAGE}:${GIT_BRANCH}

pull:
	docker pull debian:stretch
	docker pull registry.gitlab.com/prosoma/supervisord:latest

run: PUID=1000
run: PGID=1000
run: init
	docker run -it --rm -e PUID=${PUID} -e PGID=${PGID} ${DOCKER_IMAGE}:${GIT_BRANCH} ${CMD}
