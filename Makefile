OS=`docker info | grep OSType: | cut -f3 -d' '`
ARCH=`docker info | grep Architecture: | cut -f3 -d' '`
NAME=`grep container_name: docker-compose.yml | cut -f6 -d' '`
VERSION=`cat .version`
IMAGE=majenko/${NAME}-${OS}-${ARCH}:${VERSION}

all: Dockerfile
	@echo "Building ${IMAGE}"
	@docker build -t ${IMAGE} .
	
push:
	@docker push ${IMAGE}
