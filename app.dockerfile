FROM php:apache

RUN apt-get update && \
    apt-get install -y nano

COPY site1.conf /etc/apache2/sites-available/site1.conf
COPY site2.conf /etc/apache2/sites-available/site2.conf

RUN a2ensite site1.conf && a2ensite site2.conf