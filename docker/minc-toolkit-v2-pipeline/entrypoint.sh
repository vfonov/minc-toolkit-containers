#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-1000}
USER_GID=${LOCAL_USER_GID:-1000}
echo "Starting with $USER_ID:$USER_GID"
groupadd -f -g $USER_GID user
useradd --shell /bin/bash -u $USER_ID -g $USER_GID -o -c "" -m user
export HOME=/mouse

#exec /usr/local/bin/gosu user "$@"
exec su --preserve-environment -l user --shell /bin/bash --command "$@"
