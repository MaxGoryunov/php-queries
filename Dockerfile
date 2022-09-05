FROM composer AS composer
WORKDIR /app
ADD . /app
RUN composer install

FROM php:latest
WORKDIR /app
COPY --from=composer /app /app
COPY --from=composer /usr/bin/composer /usr/bin/composer