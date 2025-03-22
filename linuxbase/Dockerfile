FROM ubuntu:latest

ENV LANG=en_GB.utf8
ENV LANGUAGE=en_GB:en
ENV LC_ALL=en_GB.UTF-8
ENV TZ="Europe/London"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install locales git curl wget
RUN locale-gen en_GB.UTF-8

RUN apt-get install -y \
    clang \
    gcc \
    build-essential \
    openssl
RUN apt-get clean
