FROM lcbruit/linuxbase:latest

RUN mkdir /apps

ENV PATH=/venv/bin:$PATH
ENV PATH=/root/.cargo/bin:$PATH

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# set up a virtual env to use for whatever app is destined for this container.
RUN uv venv --python 3.12 /venv

RUN echo "\nsource /venv/bin/activate\n" >> /root/.zshrc
RUN uv --version

# Install some of the common packages that (many) don't change often so later images build faster.
RUN apt-get install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev

# Main dependencies
RUN uv pip install git+https://github.com/LCBRU/lbrc_flask.git

# Base web servers for a minimum version
RUN uv pip install --upgrade granian[pname]

RUN echo "We're good:"
RUN /venv/bin/python --version
