{{ $DOCUMENT_ROOT := default .Env.DOCUMENT_ROOT "/var/www/symfony/web" }}
{{ $APACHE_LOG_DIR := default .Env.APACHE_LOG_DIR "/var/log/apache2" }}
{{ $APACHE_LOG_PREFIX := default .Env.APACHE_LOG_PREFIX "symfony" }}
{{ $PHP_CONTAINER_NAME := default .Env.PHP_CONTAINER_NAME "php" }}

<VirtualHost *:80>
    UseCanonicalName Off

    AddHandler php5-fcgi .php
    Action php5-fcgi /php5-fcgi
    Alias /php5-fcgi /usr/lib/cgi-bin/php5-fcgi
    FastCgiExternalServer /usr/lib/cgi-bin/php5-fcgi -host {{ $PHP_CONTAINER_NAME }}:9000 -idle-timeout {{ default .Env.FASTCGI_IDLE_TIMEOUT "90" }} -pass-header Authorization


    DocumentRoot {{ $DOCUMENT_ROOT }}
    <Directory {{ $DOCUMENT_ROOT }}>
        DirectoryIndex index.html index.php

        Options FollowSymlinks
        AllowOverride All
        Order Allow,Deny
        Allow from all
    </Directory>

    ErrorLog {{ $APACHE_LOG_DIR }}/{{ $APACHE_LOG_PREFIX }}_error.log
    CustomLog /proc/self/fd/1 combined
</VirtualHost>
