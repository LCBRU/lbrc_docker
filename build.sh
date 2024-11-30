#!/usr/bin/env bash

# # Python
# docker build -t lcbruit/linuxbase:latest ./linuxbase
# docker build -t lcbruit/pythonbase:latest ./pythonbase
# docker build -t lcbruit/pythonwebappbase:latest ./pythonwebappbase

# ## Identity
# docker build --no-cache -t lcbruit/identity_web:latest ./identity/web
# docker build --no-cache -t lcbruit/identity_celery:latest ./identity/celery

# # REDCap
# docker build -t lcbruit/redcapbase:latest ./redcapbase

## REDCap Specific
docker build -t lcbruit/redcapbase:latest ./redcapbase
docker build --build-arg redcap_directory=redcap_dev --build-arg image_type=dev -t lcbruit/redcap_dev:latest ./redcap_specific
docker build --build-arg redcap_directory=genvasc_redcap --build-arg image_type=genvasc -t lcbruit/redcap_genvasc:latest ./redcap_specific
docker build --build-arg redcap_directory=redcap --build-arg image_type=uhl -t lcbruit/redcap_uhl:latest ./redcap_specific
docker build --build-arg redcap_directory=redcap --build-arg image_type=n3 -t lcbruit/redcap_n3:latest ./redcap_specific
docker build --build-arg redcap_directory=redcap --build-arg image_type=national -t lcbruit/redcap_national:latest ./redcap_specific
docker build --build-arg redcap_directory=redcap_test --build-arg image_type=test -t lcbruit/redcap_test:latest ./redcap_specific
