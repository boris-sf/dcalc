FROM bellsoft/liberica-openjdk-alpine:17-35
RUN apk upgrade && apk add git maven make
WORKDIR /app
CMD ["sh", "-c", "rm -rf bin source && mkdir bin && git clone $REPO source && cd source && make release TARGET=../bin/app.jar && cd .. && ls -l && java -jar bin/app.jar"]

