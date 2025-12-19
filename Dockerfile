FROM php:8.4-cli-alpine

ENV PROJECT_DIR /var/www/html

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache \
        bash \
        git && \
    install-php-extensions \
        amqp \
        @composer

ENV PATH $PROJECT_DIR/bin:$PROJECT_DIR/vendor/bin:$PATH

WORKDIR $PROJECT_DIR
