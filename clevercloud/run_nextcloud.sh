docker run -d -p 8080:80 \
  -e NEXTCLOUD_ADMIN_USER="$NEXT_USER" \
  -e NEXTCLOUD_ADMIN_PASSWORD="$NEXT_PSWD" \
  nextcloud