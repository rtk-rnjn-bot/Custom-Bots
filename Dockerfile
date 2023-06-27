FROM python:3-slim-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git --no-install-recommends && \
    apt-get install -y ffmpeg --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-cache-dir

COPY . .

CMD ["python", "main.py"]
