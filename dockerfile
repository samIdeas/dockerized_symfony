FROM php:8.2-fpm

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    bash \
    procps \
    unzip \
    git \
    curl

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.7.5