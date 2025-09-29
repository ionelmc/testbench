#!/bin/bash
set -euxo pipefail

holdup -v -t5 unix:///var/app/run/uwsgi.sock unix:///var/app/run/granian.sock unix:///var/app/run/uvicorn.sock
holdup -v -t10 --insecure https://nginx/local https://nginx/uvicorn https://nginx/uwsgi https://nginx/granian
rewrk "$@" -h https://nginx/local
rewrk "$@" -h https://nginx/uvicorn
rewrk "$@" -h https://nginx/granian
rewrk "$@" -h https://nginx/uwsgi
