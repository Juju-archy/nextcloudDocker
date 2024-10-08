FROM nextcloud:latest

# Déclarer des variables build-time
ARG NEXT_USER
ARG NEXT_PSWD
ARG POSTGRESQL_ADDON_DB
ARG POSTGRESQL_ADDON_HOST
ARG POSTGRESQL_ADDON_PASSWORD
ARG POSTGRESQL_ADDON_PORT
ARG POSTGRESQL_ADDON_USER

# Définir des variables d'environnement à partir des arguments build-time
ENV NEXTCLOUD_ADMIN_USER=${NEXT_USER}
ENV NEXTCLOUD_ADMIN_PASSWORD=${NEXT_PSWD}
ENV NEXTCLOUD_DB_TYPE=pgsql
ENV NEXTCLOUD_DB_HOST=${POSTGRESQL_ADDON_HOST}
ENV NEXTCLOUD_DB_PORT=${POSTGRESQL_ADDON_PORT}
ENV NEXTCLOUD_DB_NAME=${POSTGRESQL_ADDON_DB}
ENV NEXTCLOUD_DB_USER=${POSTGRESQL_ADDON_USER}
ENV NEXTCLOUD_DB_PASSWORD=${POSTGRESQL_ADDON_PASSWORD}
ENV NEXTCLOUD_DB_SSL_MODE=disable

# Exposer le port 80 pour Apache
EXPOSE 80
