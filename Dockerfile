FROM python:3

ADD requirements.txt .

RUN apt-get update && \
  apt-get install make && \
  pip install --upgrade pip setuptools && \
  pip install -r requirements.txt

