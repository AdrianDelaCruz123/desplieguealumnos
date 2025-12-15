FROM php:8.3-apache

# FORZAR UN ÚNICO MPM (prefork)
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2enmod mpm_prefork

# Activar rewrite (seguro)
RUN a2enmod rewrite

# Copiar la app
COPY src/ /var/www/html/
