#!/bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

set -exu

IMAGE_NAME="$1"
shift

export UBUNTU_VERSION="20.04"

export BASE_IMAGE="ubuntu:${UBUNTU_VERSION}"
echo "Building ${IMAGE_NAME} Docker image"

docker build \
  --no-cache \
  --progress=plain \
  -f Dockerfile \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  "$@" \
  .
