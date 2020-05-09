.PHONY: build run daemon test

build:
	docker build -t goldimage/tk4:latest .
	docker tag goldimage/tk4:latest goldimage/tk4:v0.4.12
	docker login
	docker push goldimage/tk4:latest
	docker push goldimage/tk4:v0.4.12

run:
	docker run -it -p 3270:3270 -p 8038:8038 goldimage/tk4:v0.4.12

daemon: 
	docker run -d -p 3270:3270 -p 8038:8038 goldimage/tk4:latest

test:
	hadolint Dockerfile
