FROM lcbruit/pythonbase:latest

# Install some of the common packages that (many) don't change often so later images build faster.
RUN apt-get install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev weasyprint

# Make sure we have the latest web servers if the bases are cached.
RUN uv pip install --upgrade granian[pname]

# Expose the port that Granián will use
EXPOSE 8080

# Set the command to run when the container starts (Granián)
ENTRYPOINT [  \
    "/venv/bin/granian",\
    "app:application", \
    "--host","0.0.0.0", \
    "--port","8080", \
    "--interface","wsgi", \
    "--no-ws", \
    "--workers","2", \
    "--threads","4", \
    "--loop","uvloop", \
    "--log-level","info",\
    "--log", \
    "--process-name", \
    "granian [uv-docker-app]" \
    ]

