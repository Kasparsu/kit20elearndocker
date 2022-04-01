FROM php:apache

RUN apt-get update && apt-get install -y zip git

RUN php -r "copy('https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer', 'composer-setup.php');" && \
    php composer-setup.php --filename=composer --install-dir=/bin && \
    php -r "unlink('composer-setup.php');"

RUN docker-php-ext-install pdo pdo_mysql
COPY ./entrypoint.sh /entrypoint.sh

COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www
ENTRYPOINT [ "/entrypoint.sh" ]