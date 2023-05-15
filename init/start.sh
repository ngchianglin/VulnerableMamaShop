#!/bin/bash

/etc/init.d/mysql start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start mariadb: $status"
  exit $status
fi

echo "Initializing database"
mysql -u root < /root/db.sql


/etc/init.d/php7.0-fpm start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php7.0-fpm: $status"
  exit $status
fi

/usr/sbin/apache2 -D FOREGROUND