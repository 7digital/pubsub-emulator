#!/usr/bin/env bash

if [[ -z "${PUBSUB_PROJECT_ID}" ]]; then
  echo "Missing PUBSUB_PROJECT_ID environment variable" >&2
  exit 1
fi

if [[ -z "${PUBSUB_LISTEN_ADDRESS}" ]]; then
  echo "Missing PUBSUB_LISTEN_ADDRESS environment variable" >&2
  exit 1
fi

gcloud config set project ${PUBSUB_PROJECT_ID}

gcloud beta emulators pubsub start \
  --data-dir=/opt/data \
  --host-port=${PUBSUB_LISTEN_ADDRESS}