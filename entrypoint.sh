#!/usr/bin/env bash
set -Eeuo pipefail

SPHINX_BUILDER=${SPHINX_BUILDER:-html}
SOURCEDIR=${SOURCEDIR:-.}
SPHINX_BUILD_ARGS=${SPHINX_BUILD_ARGS:-""}
CONFLUENCE_SERVER=${CONFLUENCE_SERVER:-}
CONFLUENCE_USER=${CONFLUENCE_USER:-}
CONFLUENCE_PASS=${CONFLUENCE_PASS:-}

sphinx-build -b ${SPHINX_BUILDER} "${SOURCEDIR}" "${SOURCEDIR}/_build" \
  -D plantuml='/usr/bin/java -jar /usr/local/plantuml.jar' \
  -D confluence_server_url=$CONFLUENCE_SERVER \
  -D confluence_server_user=$CONFLUENCE_USER \
  -D confluence_server_pass=$CONFLUENCE_PASS \
  ${SPHINX_BUILD_ARGS} "$@"
