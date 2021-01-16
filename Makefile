
NAME=python-sphinx
VERSION=20210115
TAG=production
# Include a trailing slash here only
# if REGISTRY is empty, like for the
# default Docker Hub.
REGISTRY=registry.hub.docker.com
# This is the namespace within the registry
PROJECT=mcallaway

build:
	docker build . -t $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION) | tee build.log

tag: build
	docker tag $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)/$(PROJECT)/$(NAME):$(TAG)
	docker tag $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)/$(PROJECT)/$(NAME):latest

push: tag
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION)
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):$(TAG)
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):latest

all: build tag push
