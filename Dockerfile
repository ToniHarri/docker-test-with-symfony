# Use a pre-defined image from Docker Hub.
FROM php:7.4-fpm

# Expose container port 80 for this project.
EXPOSE 80

# Use WORKDIR to specify that all subsequent actions should be taken from the
# this directory in your image filesystem (never the host’s filesystem).
WORKDIR /var/www/app

COPY . /var/www/app

# Use custom php.ini
COPY .Docker/Php/php.ini $PHP_INI_DIR/conf.d/

# PHP extension zip requires libzip
# intl requires libicu-dev
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libicu-dev \
    libzip-dev \
    zip \
    unzip

# Install required PHP Core extensions for Symfony and dependencies to run
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure zip \
    && docker-php-ext-install zip
# Used for Symfony validators
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl
# Speed up PHP with an accelerator
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache
RUN docker-php-ext-install mysqli pdo pdo_mysql


# Install and run composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN if [ "$APP_ENV" = "prod" ]; then export ARGS="--no-dev"; fi
RUN composer install \
    --no-ansi \
    --no-interaction \
    --optimize-autoloader \
    --no-progress \
    $ARGS

# FUTURE TODO: "Run the dump-env command after each deploy to improve the application performance"
# RUN composer dump-env prod
