.PHONY: build run daemon test

build:
	docker build -t mvs-container .

run:
	docker run -it -p 3270:3270 -p 8038:8038 mvs-container

daemon: 
	docker run -d -p 3270:3270 -p 8038:8038 mvs-container

test:
	hadolint Dockerfile