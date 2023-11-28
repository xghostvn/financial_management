#!/bin/bash
docker-compose -f /var/www/html/docker-compose.yml up -d --build
docker exec -it be_service php /usr/local/bin/composer install -d /var/www
