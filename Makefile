GO=go
GOFMT=gofmt
DELETE=rm
BINARY=beanstalkd-benchmark
# go source files, ignore vendor directory
SRC = $(shell find . -type f -name '*.go' -not -path "./vendor/*")
# current git version short-hash
VER = $(shell git rev-parse --short HEAD)
TAG = "$(BINARY):$(VER)"

info:
	@echo "---------------------------------------------------------------"
	@echo
	@echo " build          generate a build target to local setup         "
	@echo " clean          clean up bin/                                  "
	@echo " fmt            format using go fmt                            "
	@echo " release/darwin generate a darwin target build                 "
	@echo " release/linux  generate a linux target build                  "
	@echo " run            build & run $(BINARY) locally                  "
	@echo 
	@echo "---------------------------------------------------------------" 

build: clean fmt
	$(GO) build -o bin/$(BINARY) -v beanstalkd_benchmark.go

release/%: clean fmt
	@echo "build GOOS: $(subst release/,,$@) & GOARCH: amd64"
	GOOS=$(subst release/,,$@) GOARCH=amd64 $(GO) build -o bin/$(subst release/,,$@)/$(BINARY) -v main.go

run: build
	bin/$(BINARY) 

fmt:
	$(GOFMT) -l -w $(SRC)

.PHONY: clean
clean:
	$(DELETE) -rf bin/
	$(GO) clean -cache