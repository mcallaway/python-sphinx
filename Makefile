
NAME=python-sphinx
TAG=production
REGISTRY=registry.gsc.wustl.edu/
PROJECT=genome

build:
	docker build . -t $(REGISTRY)$(PROJECT)/$(NAME):$(TAG)

latest: build
	docker tag $(REGISTRY)$(PROJECT)/$(NAME):$(TAG) $(REGISTRY)$(PROJECT)/$(NAME):latest

push:
	docker push $(REGISTRY)$(PROJECT)/$(NAME):$(TAG)
	docker push $(REGISTRY)$(PROJECT)/$(NAME):latest

all: build latest push
