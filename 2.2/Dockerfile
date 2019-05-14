FROM lephare/debian:wheezy

RUN apt-get update && \
    apt-get install -y apache2 curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY libapache2-mod-fastcgi_2.4.7~0910052141-1_amd64.deb /root/
RUN dpkg -i /root/libapache2-mod-fastcgi_2.4.7~0910052141-1_amd64.deb && \
    chmod -R g+rwx /var/lib/apache2/fastcgi

EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN a2dissite 000-default && \
    a2enmod proxy_http rewrite headers expires actions && \
    curl -sL https://github.com/jwilder/dockerize/releases/download/v0.0.4/dockerize-linux-amd64-v0.0.4.tar.gz | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/* && \
    mkdir -p /etc/dockerize/templates && \
    sed -ri ' \
      s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
      s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
    ' /etc/apache2/conf.d/*

COPY virtualhost.conf.tpl /etc/dockerize/templates/virtualhost.conf.tpl

ENTRYPOINT ["dockerize", "-template", "/etc/dockerize/templates/virtualhost.conf.tpl:/etc/apache2/sites-enabled/virtualhost.conf"]
CMD usermod -u $DOCKER_USER_ID www-data && /usr/sbin/apache2ctl -D FOREGROUND
