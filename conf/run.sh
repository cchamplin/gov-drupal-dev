#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

# Ideally this would  be in a separate container
exec /bin/bash -c "mailcatcher --smtp-port 1025 --http-ip=0.0.0.0 -f" &

exec /usr/sbin/apachectl -DFOREGROUND

