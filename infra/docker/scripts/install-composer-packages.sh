#!/bin/bash -x
printf "Installing composer packages for $APP_ENV.\n"
if [ "$APP_ENV" = "DEV" ]; then
  composer install
elif [ "$APP_ENV" = "TEST" ]; then
  composer install
elif [ "$APP_ENV" = "PROD" ]; then
  composer install --no-dev --optimize-autoloader --no-scripts
  composer dump-env prod --empty
fi
printf "Composer packages have been installed \n\n"
