#!/bin/bash
printf "==========================================================\n"
printf "======== BOOTING WORDPRESS WEBSITE CONTAINER in ${APP_ENV} mode ======\n\n"

printf "Running composer install with optimized autoloader \n\n"
if [ "$APP_ENV" = "DEV" ]; then
  composer install
elif [ "$APP_ENV" = "TEST" ]; then
  composer install
elif [ "$APP_ENV" = "PROD" ]; then
  composer install --no-dev --optimize-autoloader --no-scripts
  composer dump-env prod --empty
fi
printf "Updating WordPress config  \n\n"

./vendor/bin/wp --allow-root config create --dbname=${MYSQL_DATABASE} --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD}  --dbhost=mysql

printf "Done  \n\n"
printf "==========================================================\n"

printf "Deciding if Apache should be booted in the foreground \n\n"
printf "BOOT_APACHE = ${BOOT_APACHE} \n"
if [[ $BOOT_APACHE == "1" ]]
then
  printf "\n\n==================== WEBSITE BOOTED WITH APACHE =====================\n\n"
  apachectl -D FOREGROUND
else
  printf "\n\n==================== WEBSITE BOOTED WITHOUT APACHE =====================\n\n"
  exec "$@"
fi

