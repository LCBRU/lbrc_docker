FROM lcbruit/pythonbase:latest

RUN git clone https://github.com/LCBRU/mssql_github.git /src/
WORKDIR /src/

RUN uv pip install -r requirements.txt

ENTRYPOINT ["python", "run.py"]
