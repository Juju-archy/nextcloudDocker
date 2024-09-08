# Utiliser l'image officielle Nextcloud
FROM nextcloud:latest

# Exposer le port 80 pour Apache
EXPOSE 8080

# Démarrer Apache en avant-plan
CMD ["apache2-foreground"]
