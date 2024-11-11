FROM lcbruit/identity_web:latest

# Only needed to connect to SQL 2008
RUN apt-get update -yqq \
    && apt-get install -y --no-install-recommends openssl \ 
    && sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf \
    && sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/ssl/openssl.cnf\
    && rm -rf /var/lib/apt/lists/*

# Set the command to run when the container starts (Celery)
ENTRYPOINT [  \
    "celery",\
    "-A", \
    "celery_worker.celery" \
    ]
