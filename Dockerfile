FROM python:3

ADD requirements.txt .

RUN apt-get update && \
  apt-get install -y make rsync && \
  pip install --upgrade pip setuptools && \
  pip install -r requirements.txt

