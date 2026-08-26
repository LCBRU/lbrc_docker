FROM apache/airflow:3.3.1-python3.14

COPY packages.txt .
USER root
RUN if [[ -s packages.txt ]]; then \
        apt-get update -y && cat packages.txt | xargs apt-get install -y --no-install-recommends; \
    fi

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/12/prod.list  > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get -y install --no-install-recommends \
    libleveldb-dev \
    libsasl2-dev \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev
RUN apt-get clean

USER airflow
RUN pip install --upgrade pip
COPY webserver_config.py .

COPY requirements.txt /opt/airflow/dags/requirements.txt
COPY requirements.include /opt/airflow/dags/requirements.include

RUN pip install --no-cache-dir --user -q -r /opt/airflow/dags/requirements.txt --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-3.3.1/constraints-3.14.txt"

COPY dags/ /opt/airflow/dags/


