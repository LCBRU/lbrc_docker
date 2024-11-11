#!/usr/bin/env bash

docker build -t lcbruit/linuxbase:latest ./linuxbase
docker build -t lcbruit/pythonbase:latest ./pythonbase
docker build -t lcbruit/pythonwebappbase:latest ./pythonwebappbase
docker build --no-cache -t lcbruit/identity_web:latest ./identity/web
docker build --no-cache -t lcbruit/identity_celery:latest ./identity/celery
