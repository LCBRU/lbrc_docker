FROM lcbruit/linuxbase:latest

ENV PATH=/venv/bin:$PATH
ENV PATH=/root/.cargo/bin:$PATH

# Install some of the common packages that (many) don't change often so later images build faster.
RUN apt-get install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev weasyprint

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

RUN echo "We're good:"
RUN /venv/bin/python --version
