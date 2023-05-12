From ubuntu:xenial

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    libapache2-mod-fastcgi \
    libapache2-modsecurity \
    php7.0-fpm \
    mariadb-server \
    php-mysql \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy proxy_fcgi
RUN a2enmod security2

ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

COPY 000-default.conf /etc/apache2/sites-enabled
COPY 000-modsecurity-recommended.conf /etc/modsecurity/000-recommended.conf

COPY init /root/
COPY apps /var/www/html
COPY apache.conf /etc/apache2/apache2.conf

RUN chmod 644 /var/www/html/*

EXPOSE 80/tcp

RUN ["/bin/bash", "/root/start.sh"]
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

#ENTRYPOINT ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
