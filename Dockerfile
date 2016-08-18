#FROM usdaeas/gov-drupal:php54
# TODO DELETE NEXT LINE 
FROM gd54

MAINTAINER Jerry Eshbaugh <Jerry@TheStrategicProduct.com>

RUN yum -y install \
    rubygems \
    ruby-devel \
    tmux \
    git \
    sqlite-devel

# Add Dev tools,etc to directory
COPY conf/tools/ /usr/local/share/lap-docker/

# Apache config, and PHP config, test apache config
# See https://github.com/docker/docker/issues/7511 /tmp usage
COPY centos-7 /tmp/centos-7/
RUN rsync -a /tmp/centos-7/etc/httpd /etc/ && \
    apachectl configtest
RUN rsync -a /tmp/centos-7/etc/php* /etc/

# Install Pimpmylog
# using either git clone or wget both fail hangs on build with a timeout, although it sometimes works 
# when exected into the container
# tested using a separate bash script and experience the same issue
RUN git clone https://github.com/eshbaugh/DevOps.git
#RUN mkdir -p /usr/local/share/lap-docker/logs && chmod 777 /usr/local/share/lap-docker/logs && git clone https://github.com/potsky/PimpMyLog.git /usr/local/share/lap-docker/logs/
#RUN wget -O - https://github.com/potsky/PimpMyLog/tarball/master | tar xzvf - && mv potsky-PimpMyLog-* /usr/local/share/lap-docker
#COPY conf/pimpmylog/pimpmylog.ini /etc/php.d/pimpmylog.ini
# Creates default configuration file
#COPY conf/pimpmylog/config.user.php /usr/local/share/lap-docker/logs/config.user.php

# Allows apache to read log files directly
RUN mkdir -p /var/log/httpd && \
    touch /var/log/httpd/access_log && \
    touch /var/log/httpd/error_log && \
    touch /var/log/httpd/php.err && \
    chmod a+rx /var/ && \
    chmod a+rx /var/log/ && \
    chmod a+rx /var/log/httpd/ && \
    chown -R apache /var/log/httpd/

RUN gem install mailcatcher
# Tell PHP to use mailcatcher
COPY conf/mailcatcher/mailcatcher.ini /etc/php.d/mailcatcher.ini

# Install Bundler and Theme related tweaks
RUN gem install bundler

# Add mail catcher ports
# Mailcatcher on HTTP: 1080
# Mailcatcher on SMTP: 1025
EXPOSE 1025 1080

# Process management
COPY conf/run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
