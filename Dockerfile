FROM python:3.9.7

RUN mkdir /app
WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV FLASK_APP="api"

ENTRYPOINT python run.py