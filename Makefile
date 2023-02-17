LOCAL_PATH := $(shell pwd)

VERSION := 0.0.1
PROJECT := xiaolingxiao

all: image

run:
	echo "VERSION="$(VERSION) > .env
	docker-compose up

build:
	npm run build

image:
	echo "VERSION="$(VERSION) > .env
	docker build --pull --network host -t leiyu465/$(PROJECT):$(VERSION) .
	docker push leiyu465/$(PROJECT):$(VERSION)

image-base:
	docker build -f Dockerfile.base --pull --network host -t leiyu465/$(PROJECT)-base:latest .
	docker push leiyu465/$(PROJECT)-base:latest
