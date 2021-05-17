#!/bin/bash
set -e

if [ -z "$GITHUB_REPOSITORY" ]; then
  echo "[ERROR] The env variable GITHUB_REPOSITORY is required"
  exit 1
fi

echo "[INFO] Github Event"
echo "$GITHUB_EVENT_PATH"

# Returns the raw tag to be converted
get_tag() {
  prefix='refs\/.*\/'
  raw_value=$(echo "${GITHUB_REF}" | sed 's/^refs\/.*\///')
  cleaned=$(echo "${raw_value}" | sed 's/\//\-/')
  echo "[INFO] tag value ${cleaned}"
  echo "::set-output name=tag::${cleaned}"
}

get_tag
