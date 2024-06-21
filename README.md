# lephare/apache Docker image

Reference Apache 2.4 container for [Le Phare](https://www.lephare.com) projects

## Usage

```yaml
services:
  php:
    image: lephare/php:latest
    # ...

  web:
    image: lephare/apache:2.4
    volumes_from:
      - php:ro
    labels:
      caddy: "app.${DOCKER_HOST_SUFFIX:-local}"
      caddy.tls: internal
      caddy.reverse_proxy: "{{ upstreams }}"
    environment:
      DOCUMENT_ROOT: "/var/www/symfony/public"
```

## Configuration

The following settings can be adjusted using environment variables.

| Variable           | Type   | Description                                                                         | Default                   |
|--------------------|--------|-------------------------------------------------------------------------------------|---------------------------|
| DOCUMENT_ROOT      | string | [Apache DocumentRoot](https://httpd.apache.org/docs/2.4/mod/core.html#documentroot) | `/var/www/symfony/web`    |
| APACHE_LOG_DIR     | string | [Apache log directory](https://httpd.apache.org/docs/2.4/logs.html)                 | `/var/log/apache2`        |
| APACHE_LOG_PREFIX  | string | Apache log filename prefix                                                          | `app`                     |
| PHP_CONTAINER_NAME | string | PHP-FPM Docker container name / hostname                                            | `php`                     |
