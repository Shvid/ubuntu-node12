#
#   Simple makefile for golang project
#
#   Alex Shvid
#
#

NODE_VER := 12
IMAGE := ubuntu-node
VERSION := $(NODE_VER)-$(shell git describe --tags --always --dirty)
REGISTRY := shvid

all: build

version:
	@echo $(VERSION)

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) --build-arg NODE_VER=$(NODE_VER) -f Dockerfile .

run: build
	docker run $(REGISTRY)/$(IMAGE):$(VERSION) node --version

push: build
	docker push ${REGISTRY}/${IMAGE}:${VERSION}
	docker tag ${REGISTRY}/${IMAGE}:${VERSION} ${REGISTRY}/${IMAGE}:latest
	docker push ${REGISTRY}/${IMAGE}:latest
