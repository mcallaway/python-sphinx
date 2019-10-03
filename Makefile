
NAME=python-sphinx
VERSION=1.2019.11
TAG=production
REGISTRY=registry.gsc.wustl.edu/
PROJECT=genome

build:
	docker build . -t $(REGISTRY)$(PROJECT)/$(NAME):$(VERSION)

tag: build
	docker tag $(REGISTRY)$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)$(PROJECT)/$(NAME):$(TAG)
	docker tag $(REGISTRY)$(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)$(PROJECT)/$(NAME):latest

push: tag
	docker push $(REGISTRY)$(PROJECT)/$(NAME):$(VERSION)
	docker push $(REGISTRY)$(PROJECT)/$(NAME):$(TAG)
	docker push $(REGISTRY)$(PROJECT)/$(NAME):latest

all: build tag push
