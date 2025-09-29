#!/bin/bash
set -euxo pipefail
mkdir -p /var/app/run /var/app/static /var/app/media /var/app/logs
chown -R app:app /var/app || true

# Copy files in the /etc/app volume. Note that the "/" suffix is significant.
rsync --itemize-changes --ignore-existing --recursive --links /etc/app-defaults/ /etc/app
rsync --itemize-changes --backup --info=backup --checksum --suffix=".$(date +'%Y%m%d%H%M%S')~" --recursive /etc/app-latest/ /etc/app

exec "$@"
