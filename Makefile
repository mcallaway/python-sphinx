
NAME=python-sphinx
TAG=production

build:
	docker build . -t registry.gsc.wustl.edu/genome/$(NAME):$(TAG)

latest: build
	docker tag registry.gsc.wustl.edu/genome/$(NAME):$(TAG) registry.gsc.wustl.edu/genome/$(NAME):latest

push:
	docker push registry.gsc.wustl.edu/genome/$(NAME):$(TAG)
	docker push registry.gsc.wustl.edu/genome/$(NAME):latest

all: build latest push
