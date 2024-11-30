#!/usr/bin/env bash

# Python
docker push lcbruit/linuxbase:latest
docker push lcbruit/pythonbase:latest
docker push lcbruit/pythonwebappbase:latest

## Identity
docker push lcbruit/identity_web:latest
docker push lcbruit/identity_celery:latest

# REDCap
docker push lcbruit/redcapbase:latest
