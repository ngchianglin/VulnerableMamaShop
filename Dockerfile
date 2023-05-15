From ubuntu:xenial

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    libapache2-mod-fastcgi \
#    libapache2-modsecurity \
    php7.0-fpm \
    mariadb-server \
    php-mysql \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy proxy_fcgi
RUN apt-get update -y

# Install Required Dependencies
RUN apt-get install -y g++ flex bison curl apache2-dev \
	doxygen libyajl-dev ssdeep liblua5.2-dev \
	libgeoip-dev libtool dh-autoreconf \
	libcurl4-gnutls-dev libxml2 libpcre++-dev \
	libxml2-dev git wget tar apache2 libapache2-mod-fastcgi \
    php7.0-fpm php-mysql mariadb-server \ 
&& rm -rf /var/lib/apt/lists/*
# Download LibModsecurity 
RUN wget https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.4/modsecurity-v3.0.4.tar.gz

# Extract the Downloaded File
RUN tar xzf modsecurity-v3.0.4.tar.gz && rm -rf modsecurity-v3.0.4.tar.gz

# Compile and Install LibModsecurity
RUN cd modsecurity-v3.0.4 && \
	./build.sh && ./configure && \
	make && make install

# Install ModSecurity-Apache Connector
RUN cd ~ && git clone https://github.com/SpiderLabs/ModSecurity-apache

RUN cd ~/ModSecurity-apache && \
	./autogen.sh && \
	./configure --with-libmodsecurity=/usr/local/modsecurity/ && \
	make && \
	make install

# Load the Apache ModSecurity Connector Module
RUN echo "LoadModule security3_module /usr/lib/apache2/modules/mod_security3.so" >> /etc/apache2/apache2.conf

# Configure ModSecurity
RUN mkdir /etc/apache2/modsecurity.d && \
	cp modsecurity-v3.0.4/modsecurity.conf-recommended /etc/apache2/modsecurity.d/modsecurity.conf && \
	cp modsecurity-v3.0.4/unicode.mapping /etc/apache2/modsecurity.d/ 
#	sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/apache2/modsecurity.d/modsecurity.conf
ADD conf/modsec_rules.conf /etc/apache2/modsecurity.d/

# Install OWASP ModSecurity Core Rule Set (CRS) on Ubuntu
RUN git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /etc/apache2/modsecurity.d/owasp-crs && \
	cp /etc/apache2/modsecurity.d/owasp-crs/crs-setup.conf.example /etc/apache2/modsecurity.d/owasp-crs/crs-setup.conf

# Activate ModSecurity
RUN mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old
ADD conf/000-default.conf /etc/apache2/sites-available/
ADD conf/000-docker.conf /etc/apache2/conf-enabled/

# Initalize Apache Env
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

COPY init /root/
COPY apps /var/www/html
RUN chmod 644 /var/www/html/*

EXPOSE 80

CMD ["/bin/bash", "/root/start.sh"]
