#!/bin/bash
docker exec -it be_service php /usr/local/bin/composer install -d /var/www
