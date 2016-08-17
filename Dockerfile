FROM usdaeas/gov-drupal:php54
MAINTAINER Ron Williams <hello@ronwilliams.io>
ENV PATH /usr/local/src/vendor/bin/:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


# Add Dev tools,etc to directory
COPY conf/tools/ /usr/local/share/lap-docker/

# Apache config, and PHP config, test apache config
# See https://github.com/docker/docker/issues/7511 /tmp usage
COPY centos-7 /tmp/centos-7/
RUN rsync -a /tmp/centos-7/etc/httpd /etc/ && \
    apachectl configtest
RUN rsync -a /tmp/centos-7/etc/php* /etc/

# Install Pimpmylog
RUN mkdir -p /usr/local/share/lap-docker/logs && git clone https://github.com/potsky/PimpMyLog.git /usr/local/share/lap-docker/logs/
COPY conf/pimpmylog/pimpmylog.ini /etc/php.d/pimpmylog.ini
# Creates default configuration file
COPY conf/pimpmylog/config.user.php /usr/local/share/lap-docker/logs/config.user.php

# Allows apache to read log files directly
RUN mkdir -p /var/log/httpd && \
    touch /var/log/httpd/access_log && \
    touch /var/log/httpd/error_log && \
    touch /var/log/httpd/php.err && \
    chmod a+rx /var/ && \
    chmod a+rx /var/log/ && \
    chmod a+rx /var/log/httpd/ && \
    chown -R apache /var/log/httpd/

# Install Mailcatcher Dependencies.
RUN yum -y install \
    rubygems \
    ruby-devel \
    sqlite-devel
# Install Mailcatcher.
RUN gem install mailcatcher
# Tell PHP to use mailcatcher
COPY conf/mailcatcher/mailcatcher.ini /etc/php.d/mailcatcher.ini

# Install Bundler and Theme related tweaks
RUN gem install bundler

# Process management
COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/lamp.sh /etc/lamp.sh

# Apache on HTTP: 80
# Apache on HTTPS: 443
# Mailcatcher on HTTP: 1080
# Mailcatcher on SMTP: 1025
EXPOSE 80 443 1025 1080

RUN chmod +x /etc/lamp.sh
CMD ["/etc/lamp.sh"]
