build:
	go build -o place cmd/place/place.go

build_arm:
	GOOS=linux GOARCH=arm64 go build -o place_arm cmd/place/place.go

clean:
	rm place place_arm

dist: build build_arm
	tar czvf place_$(shell git rev-parse --short HEAD).tar.gz place place_arm web
