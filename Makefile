.PHONY: build run

build:
	docker build -t mvs-container .

run:
	docker run -it -p 3270:3270 -p 8038:8038 mvs-container