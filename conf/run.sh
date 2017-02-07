#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

# Perform git pull
if [ -d "/var/application/www" ]; then
  if [ -v GIT_BRANCH ]; then
    git --git-dir=/var/application git checkout $GIT_BRANCH
    git --git-dir=/var/application git pull origin $GIT_BRANCH
  fi
else 
  if [ -v GIT_URL ]; then
    git clone $GIT_URL /var/application
    if [ -d "/var/application/www" ]; then
      if [ -v GIT_BRANCH ]; then
        git --git-dir=/var/application git checkout $GIT_BRANCH
        git --git-dir=/var/application git pull origin $GIT_BRANCH
      fi
      if [ -d "/var/www/public" ]; then
        mv /var/www/public /var/www/public_orig
      fi
      ln -s /var/application/www /var/www/public
    fi
  fi
fi
# Ideally this would  be in a separate container
exec /bin/bash -c "mailcatcher --smtp-port 1025 --http-ip=0.0.0.0 -f" &

exec /usr/sbin/apachectl -DFOREGROUND

