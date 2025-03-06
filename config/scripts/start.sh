#!/bin/sh

# Define the working directory
cd /var/www/html/app || exit 1
echo "Actual working directory: $(pwd)"

# Check if Symfony is already installed
if [ ! -d "vendor" ]; then
    echo "Symfony installation..."
    composer create-project symfony/skeleton:"7.2.*" .
    chown -R www-data:www-data .
    chmod 777 /var/www/html/app/composer.json
    chmod 777 /var/www/html/app/.gitignore
else
    echo "Symfony is already installed."
fi

# Start PHP-FPM
echo "PHP-FPM starting..."
php-fpm