FROM lcbruit/linuxbase:latest

ENV PATH=/venv/bin:$PATH
ENV PATH=/root/.cargo/bin:$PATH

RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    git \
    libsasl2-dev \
    python-dev-is-python3 \
    libldap2-dev \
    libssl-dev \
    weasyprint
# ODBC Install Start
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
RUN curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get -y install --no-install-recommends \
    mariadb-client \
    libldap2-dev \
    libsasl2-dev
RUN ACCEPT_EULA=Y apt-get -y install --no-install-recommends \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev
# ODBC Install End
RUN apt-get clean

# Only needed to connect to SQL 2008
RUN apt-get update -yqq \
    && apt-get install -y --no-install-recommends openssl \ 
    && sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf \
    && sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/ssl/openssl.cnf\
    && rm -rf /var/lib/apt/lists/*

# Download the latest installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"

# set up a virtual env to use for whatever app is destined for this container.
RUN uv venv --python 3.12 /venv

RUN echo "\nsource /venv/bin/activate\n" >> /root/.zshrc
RUN echo "\nsource /venv/bin/activate\n" >> /root/.bashrc
RUN uv --version

RUN /venv/bin/python --version
