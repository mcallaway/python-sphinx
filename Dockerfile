FROM python:3

ADD requirements.txt .

RUN apt-get update && \
  apt-get install -y \
  make rsync openjdk-8-jre-headless graphviz plantuml && \
  pip install --upgrade pip setuptools && \
  pip install -r requirements.txt && \
  apt-get clean all

