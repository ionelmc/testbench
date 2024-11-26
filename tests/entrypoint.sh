#!/bin/bash
set -euxo pipefail

holdup --verbose --insecure --timeout=5 https://nginx/uwsgi https://nginx/granian
rewrk -c 10 -d 60s -h https://nginx/uwsgi
rewrk -c 10 -d 60s -h https://nginx/granian
