# Apache Containers

Reference apache containers for our stack

## Usage

```shell

docker run -p '8000:80' lephare/apache:2.4

```

## Configuration

You can change settings by adding an environment var to the container.

| Variable              | Type   | Description                    | Default              |
|-----------------------|--------|--------------------------------|----------------------|
| PUID                  | int    | Allows to change uid of apache | 1000                 |
| DOCUMENT_ROOT         | string | Set document root              | /var/www/symfony/web |
| APACHE_LOG_DIR        | string | Set log directory              | /var/log/apache2     |
| APACHE_LOG_PREFIX     | string | Set log prefix                 | app                  |
| PHP_CONTAINER_NAME    | string | Configure php service name     | php                  |

## Examples

```shell
docker run \
    -e FF_BROTLI=true \
    -e DOCUMENT_ROOT=/var/www/html \
    -e PHP_CONTAINER_NAME=app \
    -p '8000:80'
    -v $(pwd):/var/www/html
    lephare/apache:2.4
```

## Feature Flags (only available on 2.4)


| Variable              | Type | Description                  | Default |
|-----------------------|------|------------------------------|---------|
| FF_BROTLI             | bool | Enable brotli compression    | false   |


### Brotli configuration

| Variable              | Type | Description                  | Default |
|-----------------------|------|------------------------------|---------|
| BROTLI_COMPRESS_LEVEL | int  | Set brotli compression level | 4       |
