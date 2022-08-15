NAME=myapp

.PHONY: help
help:
	@echo "hello"

.PHONY: build
build:
	@echo Build image
	@docker build -t ${NAME} .

.PHONY: run
run: ensure-repo
	@docker run -it --rm -e REPO=${REPO} ${NAME}

.PHONY: ensure-repo
ensure-repo:
ifeq ($(strip ${REPO}),)
	$(error REPO parameter is not specified)
endif
