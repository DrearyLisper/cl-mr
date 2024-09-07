FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl bash build-base ncurses-dev sbcl git

RUN curl -L https://qlot.tech/installer | bash

COPY . .

RUN qlot install

ENTRYPOINT qlot exec sbcl --noinform --eval "(ql:quickload :cl-mr)" --eval "(main:main)" --quit
