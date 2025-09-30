#!/bin/bash
set -euxo pipefail

holdup -v -t5 \
    unix:///var/app/run/uwsgi.sock \
    path:///var/app/run/granian-asgi.sock \
    path:///var/app/run/granian-wsgi.sock \
    unix:///var/app/run/uvicorn.sock
chmod 666 /var/app/run/granian*.sock
holdup -v -t5 \
    unix:///var/app/run/granian-asgi.sock \
    unix:///var/app/run/granian-wsgi.sock
holdup -v -t10 --insecure \
    https://nginx/local \
    https://nginx/uvicorn \
    https://nginx/uwsgi \
    https://nginx/granian-asgi \
    https://nginx/granian-wsgi
rewrk "$@" -h https://nginx/uvicorn
rewrk "$@" -h https://nginx/granian-asgi
rewrk "$@" -h https://nginx/granian-wsgi
rewrk "$@" -h https://nginx/uwsgi
rewrk "$@" -h https://nginx/local
rewrk "$@" -h https://granian
