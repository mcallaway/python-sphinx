
NAME=python-sphinx
VERSION=20201014
TAG=production
# Do not include a trailing slash here
REGISTRY=registry.gsc.wustl.edu
# Namespace within the registry
PROJECT=genome

build:
	docker build . -t $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION)

tag: build
	docker tag $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)$(PROJECT)/$(NAME):$(TAG)
	docker tag $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)$(PROJECT)/$(NAME):latest

push: tag
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):$(VERSION)
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):$(TAG)
	docker push $(REGISTRY)/$(PROJECT)/$(NAME):latest

all: build tag push
