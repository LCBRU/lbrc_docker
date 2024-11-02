FROM lcbruit/pythonbase:latest

RUN mkdir /app
RUN touch /app/requirements.txt
WORKDIR "/app"

RUN uv pip install -r requirements.txt

# Make sure we have the latest web servers if the bases are cached.
RUN uv pip install --upgrade granian[pname]

# Expose the port that Granián will use
EXPOSE 8080

# Set the command to run when the container starts (Granián)
ENTRYPOINT [  \
    "/venv/bin/granian",\
    "app:app", \
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

