FROM httpd

RUN apt-get update && \
    apt-get install -y nano

COPY httpd.conf /usr/local/apache2/conf/httpd.conf 