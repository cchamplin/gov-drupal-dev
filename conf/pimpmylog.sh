#!/bin/bash

mkdir -p /usr/local/share/lap-docker/logs

chmod 777 /usr/local/share/lap-docker/logs

git clone --quiet https://github.com/potsky/PimpMyLog.git /usr/local/share/lap-docker/logs/

cp conf/pimpmylog/pimpmylog.ini /etc/php.d/pimpmylog.ini

cp conf/pimpmylog/config.user.php /usr/local/share/lap-docker/logs/config.user.php

