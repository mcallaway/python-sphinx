#!/bin/bash
if [[ "$*" != *"-gui"* ]]; then
  VMARGS="-Djava.awt.headless=true"
fi
GRAPHVIZ_DOT="/usr/bin/dot" exec java $VMARGS -jar /usr/share/plantuml/plantuml.jar "$@"
