.PHONY: init build push

DOCKER_IMAGE ?= bravado/debian
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

default: build

build:
	docker build -t ${DOCKER_IMAGE}:${GIT_BRANCH} .

push: build
	docker push ${DOCKER_IMAGE}:${GIT_BRANCH}

pull:
	docker pull debian:${GIT_BRANCH}-slim

run: PUID=$(shell id -u)
run: PGID=$(shell id -g)
run: init
	docker run -it --rm -e PUID=${PUID} -e PGID=${PGID} --name debian ${DOCKER_IMAGE}:${GIT_BRANCH} ${CMD}
