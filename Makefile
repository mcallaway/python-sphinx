
NAME=python-sphinx
VERSION=20210115
TAG=production
# Include a trailing slash here
#REGISTRY=registry.gsc.wustl.edu/
# Or leave blank for Docker hub registry
REGISTRY=
# This is the namespace within the registry
PROJECT=mcallaway

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
