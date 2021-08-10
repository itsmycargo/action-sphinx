FROM python:3.9

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl openjdk-11-jre-headless graphviz \
  && rm -rf /var/lib/apt/lists/* \
  && curl -sLo /usr/local/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

COPY requirements.txt .

RUN set -ex && pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
