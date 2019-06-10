FROM python:3.7-alpine

ADD requirements.txt .

RUN pip install --upgrade pip setuptools && \
  pip install -r requirements.txt

