FROM lcbruit/pythonbase:latest

RUN git clone https://github.com/LCBRU/image_study_merge.git /src/
WORKDIR /src/

RUN uv pip install -r requirements.txt

# Set the command to run when the container starts (Celery)
ENTRYPOINT [  \
    "celery",\
    "-A", \
    "celery_worker.celery" \
    ]
