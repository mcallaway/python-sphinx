FROM python:3

ADD requirements.txt .

# Install dependencies for python sphinx
#   dvipng texlive-latex-base texlive-latex-extra for math support
#   graphviz for UML support
#   default-jre-headless for UML support (plantuml)
#   make for Makefile support
# I don't recall why we added jq and rsync.
# Possibly for the bamboo build plan for
# deployment of build results to Confluence etc.
#
RUN apt-get update && \
  apt-get install -y \
    default-jre-headless \
    dvipng \
    graphviz \
    jq \
    make \
    rsync \
    texlive-latex-base \
    texlive-latex-extra && \
  pip install --upgrade pip setuptools && \
  pip install -r requirements.txt && \
  apt-get clean all && \
  mkdir -p /usr/share/plantuml && \
  curl -L -o /usr/share/plantuml/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.1.2019.11.jar/download

ADD plantuml.sh /usr/local/bin/plantuml
