#!/bin/sh
if [ ! -d "/var/www/app/public" ]; then
    composer create-project laravel/laravel app;
fi
cd /var/www/app;
chown -R $USER:www-data storage;
chown -R $USER:www-data bootstrap/cache;
chmod -R 775 storage;
chmod -R 775 bootstrap/cache;

exec "apache2-foreground"