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

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier le fichier start.sh dans le conteneur
COPY config/scripts/start.sh /usr/local/bin/start.sh

# Donner les droits d'exécution au script
RUN chmod +x /usr/local/bin/start.sh

# Définir l'entrée du conteneur pour exécuter le script start.sh
CMD ["sh", "/usr/local/bin/start.sh"]