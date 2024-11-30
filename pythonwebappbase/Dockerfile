FROM lcbruit/pythonbase:latest

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
    "--workers","1", \
    "--threads","2", \
    "--loop","uvloop", \
    "--log-level","info",\
    "--log", \
    "--process-name", \
    "granian [uv-docker-app]" \
    ]

