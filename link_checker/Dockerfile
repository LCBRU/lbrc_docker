FROM lcbruit/pythonbase:latest

RUN git clone https://github.com/LCBRU/link_checker.git /src/
WORKDIR /src/

RUN uv pip install -r requirements.txt

ENTRYPOINT ["python", "link_checker.py"]
