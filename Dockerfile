FROM python:3

ADD requirements.txt .

RUN apt-get update && \
  apt-get install -y \
  make rsync openjdk-8-jre-headless graphviz && \
  pip install --upgrade pip setuptools && \
  pip install -r requirements.txt && \
  apt-get clean all && \
  mkdir -p /usr/share/plantuml && \
  curl -L -o /usr/share/plantuml/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.1.2019.11.jar/download

ADD plantuml.sh /usr/local/bin/plantuml
