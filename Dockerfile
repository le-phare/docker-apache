FROM httpd:2.4

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOG_PREFIX app
ENV DOCUMENT_ROOT /var/www/symfony/web
ENV PHP_CONTAINER_NAME php

RUN mkdir "${APACHE_LOG_DIR}" && \
    sed -i \
    -e 's/^#\(Include .*httpd-vhosts.conf\)/\1/' \
    -e 's/^#\(LoadModule .*mod_brotli.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_deflate.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_expires.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
    /usr/local/apache2/conf/httpd.conf

COPY virtualhost.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
