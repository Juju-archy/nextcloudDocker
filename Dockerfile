# Étape 1 : Utiliser une image de base officielle de PHP avec Apache
FROM php:8.1-apache

# Étape 2 : Installer les extensions PHP nécessaires pour Nextcloud
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libmcrypt-dev \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) iconv intl pdo_mysql zip gd xml mbstring opcache

# Étape 3 : Activer les modules Apache nécessaires
RUN a2enmod rewrite headers env dir mime setenvif

# Étape 4 : Télécharger Nextcloud (dernière version stable)
RUN curl -o nextcloud.zip https://download.nextcloud.com/server/releases/latest.zip \
    && unzip nextcloud.zip -d /var/www/ \
    && rm nextcloud.zip

# Étape 5 : Donner les permissions correctes pour Apache
RUN chown -R www-data:www-data /var/www/nextcloud

# Étape 6 : Configurer PHP pour Nextcloud (augmenter les limites de fichier et mémoire)
COPY ./php.ini /usr/local/etc/php/php.ini

# Étape 7 : Exposer le port 80 pour Apache
EXPOSE 80

# Étape 8 : Démarrer Apache (le serveur web)
CMD ["apache2-foreground"]
