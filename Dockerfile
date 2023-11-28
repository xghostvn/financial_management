FROM ubuntu:20.04

RUN apt-get update -y
RUN apt install vim htop  -y
RUN apt install ca-certificates apt-transport-https -y
RUN apt install lsb-release software-properties-common -y
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt install php8.1 php8.1-cli php8.1-fpm php8.1-apcu php8.1-opcache php8.1-common php8.1-curl php8.1-zip php8.1-mcrypt php8.1-mysql php8.1-mbstring php8.1-xml php8.1-gd php8.1-imagick php8.1-xmlrpc php8.1-maxminddb -y
RUN apt install php-cli unzip -y
RUN apt install curl -y
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN HASH=`curl -sS https://composer.github.io/installer.sig`
RUN php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN apt install nginx -y

ADD ./ /var/www
ADD ./nginx.conf /etc/nginx/sites-enabled/default
EXPOSE 80

RUN chmod 777  -R /var/www/storage/framework/
RUN chmod 777  -R /var/www/storage/logs/

CMD service nginx start;service php8.1-fpm start;tail -f /dev/null
