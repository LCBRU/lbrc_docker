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

## REDCap Specific
docker push lcbruit/redcap_dev:latest
docker push lcbruit/redcap_genvasc:latest
docker push lcbruit/redcap_uhl:latest
docker push lcbruit/redcap_n3:latest
docker push lcbruit/redcap_national:latest
docker push lcbruit/redcap_test:latest
