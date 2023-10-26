#!/bin/bash -x
printf "Installing composer packages for $APP_ENV\n"
if [ "$APP_ENV" = "dev" ]; then
  composer install
elif [ "$APP_ENV" = "test" ]; then
   composer install
elif [ "$APP_ENV" = "prod" ]; then
  composer install --no-dev --optimize-autoloader
  composer dump-env prod --empty
fi
