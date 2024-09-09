#!/bin/bash

# Vérification des variables d'environnement
if [ -z "$POSTGRESQL_ADDON_DB" ] || [ -z "$POSTGRESQL_ADDON_HOST" ] || [ -z "$POSTGRESQL_ADDON_PASSWORD" ] || [ -z "$POSTGRESQL_ADDON_PORT" ] || [ -z "$POSTGRESQL_ADDON_USER" ] || [ -z "$NEXT_USER" ] || [ -z "$NEXT_PSWD" ]; then
    echo "Missing environment variables. Please ensure all required variables are set."
    exit 1
fi

# Démarrer le conteneur Nextcloud avec les variables d'environnement
docker run -d -p 8080:80 \
  -e NEXTCLOUD_ADMIN_USER=${NEXT_USER} \
  -e NEXTCLOUD_ADMIN_PASSWORD=${NEXT_PSWD} \
  -e NEXTCLOUD_DB_TYPE=pgsql \
  -e NEXTCLOUD_DB_HOST=${POSTGRESQL_ADDON_HOST} \
  -e NEXTCLOUD_DB_PORT=${POSTGRESQL_ADDON_PORT} \
  -e NEXTCLOUD_DB_NAME=${POSTGRESQL_ADDON_DB} \
  -e NEXTCLOUD_DB_USER=${POSTGRESQL_ADDON_USER} \
  -e NEXTCLOUD_DB_PASSWORD=${POSTGRESQL_ADDON_PASSWORD} \
  -e NEXTCLOUD_DB_SSL_MODE=disable \
  nextcloud
