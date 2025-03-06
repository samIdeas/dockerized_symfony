FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    bash \
    procps \
    unzip \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.7.5

# Copier start.sh in the container
COPY config/scripts/start.sh /usr/local/bin/start.sh

# Give execution rights on the start.sh script
RUN chmod +x /usr/local/bin/start.sh

# Défine the working directory
WORKDIR /var/www/html/app

# Define the container's entrypoint
CMD ["sh", "/usr/local/bin/start.sh"]