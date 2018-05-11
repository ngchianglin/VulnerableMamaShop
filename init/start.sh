#!/bin/bash

/etc/init.d/mysql start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start mariadb: $status"
  exit $status
fi

echo "Initializing database"
mysql -u root < /root/db.sql

/etc/init.d/apache2 start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start apache2: $status"
  exit $status
fi

/etc/init.d/php7.0-fpm start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php7.0-fpm: $status"
  exit $status
fi

echo "Mamashop started. You can access it at http://localhost:[port]"
echo "[port] is where you expose the port for the docker container instance"

cd /dmonitor
/root/gosu nobody /dmonitor/mon.sh

