# java 17 modules access fix
MAVEN_OPTS := --add-opens=java.base/java.lang=ALL-UNNAMED \
              --add-opens=java.base/java.time=ALL-UNNAMED \
              --add-opens=java.base/java.math=ALL-UNNAMED \
              --add-opens=java.base/java.util=ALL-UNNAMED \
              --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
              --add-opens=java.base/java.text=ALL-UNNAMED \
              --add-opens=java.base/java.net=ALL-UNNAMED \
              --add-opens=java.sql/java.sql=ALL-UNNAMED

.PHONY: help
help:
	@echo "hello"

.PHONY: build
build:
	@echo Compile sources
	@MAVEN_OPTS="${MAVEN_OPTS}" mvn clean install -Dmaven.test.skip=${SKIP_TESTS} -DskipITs=${SKIP_E2E}

.PHONY: release
release: ensure-target build
	@echo Copy build to ${TARGET}
	@cp target/*jar-with-dependencies.jar ${TARGET}

.PHONY: ensure-target
ensure-target:
ifeq ($(strip ${TARGET}),)
	$(error TARGET parameter is not specified)
endif
