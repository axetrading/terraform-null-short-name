#!/bin/bash

set -eo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker pull ghcr.io/axetrading/terraform-test-image:latest
docker run \
    -e NO_DESTROY --rm -i -w "$dir" -v "$dir:$dir" \
    ghcr.io/axetrading/terraform-test-image:latest test/check.py