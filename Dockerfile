
FROM ubuntu

ADD requirements.txt .

# Install dependencies for python sphinx and plantuml
#   dvipng texlive-latex-base texlive-latex-extra for math support
#   groff for graphviz 'ps' manpages
#   graphviz for UML support
#   default-jre-headless for UML support (plantuml)
#   make for Makefile support
# I don't recall why we added jq and rsync.
# Possibly for the bamboo build plan for
# deployment of build results to Confluence etc.
#
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" TZ=US/Central apt-get install -y \
    curl \
    default-jre-headless \
    dvipng \
    groff \
    jq \
    make \
    rsync \
    texlive-latex-base \
    texlive-latex-extra && \
    apt-get clean all

RUN DEBIAN_FRONTEND="noninteractive" TZ=US/Central apt-get install -y \
    python3 \
    python3-pip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install -r requirements.txt && \
    apt-get clean all

RUN mkdir -p /usr/share/plantuml && \
    curl -s -k -L -o /usr/share/plantuml/plantuml.jar https://sourceforge.net/projects/plantuml/files/1.2020.19/plantuml.1.2020.19.jar/download

## Newer graphviz than 2.40 works better with PlantUML
RUN curl -s -k -L -o /opt/graphviz-2.44.1.tar.gz https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.1.tar.gz && \
    cd /opt && \
    tar xzf /opt/graphviz-2.44.1.tar.gz -C /opt && \
    cd graphviz-2.44.1 && \
    ./configure && \
    make && \
    make install

ADD plantuml.sh /usr/local/bin/plantuml
