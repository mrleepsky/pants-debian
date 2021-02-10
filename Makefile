.PHONY: deb deb-build-env deb-enter-docker

deb-build-env:
	docker build \
		--file=./debian/Dockerfile \
		--tag=pants-debian \
		./

deb: deb-build-env
	if [ ! -d ./debian/dist ]; then \
		mkdir ./debian/dist; \
	fi;
	if [ -e ./debian/dist/*.deb ]; then \
		rm ./debian/dist/*.deb; \
	fi;
	docker run \
		--volume=$$(pwd)/debian/dist:/tmp/pants-debian/debian/dist \
		pants-debian

deb-enter-docker:
	docker run \
		--interactive \
		--tty=true \
		--volume=$$(pwd):/tmp/pants-debian \
		pants-debian \
		/bin/bash
