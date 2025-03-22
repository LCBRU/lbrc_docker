FROM python:3.7

ARG version

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
        default-mysql-client && \
    apt-get clean

RUN echo "$version"

RUN git clone https://github.com/LCBRU/genvasc_portal_web.git /src/app/
ADD gunicorn.conf /usr/src/app/gunicorn.conf
WORKDIR /src/app
RUN pip install --no-cache-dir -r requirements.txt