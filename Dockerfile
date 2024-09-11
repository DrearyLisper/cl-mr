FROM ubuntu:latest

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

WORKDIR /app

RUN apt update

RUN apt install -y curl bash build-essential ncurses-dev sbcl git libev-dev

RUN curl -L https://qlot.tech/installer | bash

COPY . .

RUN qlot install

ENTRYPOINT qlot exec sbcl --noinform --eval "(ql:quickload :cl-mr)" --eval "(main:main)" --quit
