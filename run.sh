#!/bin/sh
docker run -ti \
  -v $PWD/workspace:/data/:ro \
  --env GOOGLE_APPLICATION_CREDENTIALS=/data/Gitlab-kube-81.json \
  --env CLOUDSDK_CORE_PROJECT=gitlab-coderef-ci-01 \
  --workdir /data \
  --rm \
  kiwigrid/gcloud-kubectl-helm bash
