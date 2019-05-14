FROM httpd:2.4

ENV DOCKERIZE_VERISON v0.6.1

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERISON/dockerize-linux-amd64-$DOCKERIZE_VERISON.tar.gz | tar xz -C /usr/local/bin && \
    apt-get remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/log/apache2
RUN chmod +x /usr/local/bin/dockerize && mkdir -p /etc/dockerize/templates

RUN sed -i 's/#Include conf\/extra\/httpd-vhosts.conf/Include conf\/extra\/httpd-vhosts.conf/' /usr/local/apache2/conf/httpd.conf

ENTRYPOINT ["dockerize", "-template", "/etc/dockerize/templates/virtualhost.conf.tpl:/usr/local/apache2/conf/extra/httpd-vhosts.conf"]
CMD usermod -u 1000 daemon && httpd-foreground

COPY virtualhost.conf.tpl /etc/dockerize/templates/virtualhost.conf.tpl
