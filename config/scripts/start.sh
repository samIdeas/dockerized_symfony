#!/bin/sh

# Définir le répertoire de travail
cd /var/www/html/app || exit 1
echo "Répertoire de travail actuel : $(pwd)"

# Vérifier si Symfony est déjà installé
if [ ! -d "vendor" ]; then
    echo "Installation de Symfony..."
    composer create-project symfony/skeleton:"7.2.*" .
    chown -R www-data:www-data .
    chmod 777 /var/www/html/app/composer.json
    chmod 777 /var/www/html/app/.gitignore
else
    echo "Symfony est déjà installé."
fi

# Démarrer PHP-FPM
echo "Démarrage de PHP-FPM..."
php-fpm