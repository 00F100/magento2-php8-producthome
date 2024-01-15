FROM php:8.2.15RC1-apache

WORKDIR /var/www/html

# Install dependencies for PHP + Magento2
RUN apt-get update \
    && apt-get install -y \
    libzip-dev \
    unzip \
    libgd-dev \
    libicu-dev \
    libxml2-dev \
    libxslt1-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install \
        zip \
        bcmath \
        intl \
        pdo_mysql \
        soap \
        xsl \
        sockets \
        gd

# Install Composer
RUN cd ~ \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Add user UID 1000
RUN useradd -u 1000 -d /var/www phpuser -s /bin/bash -M \
    && chown -R phpuser:phpuser /var/ \
    && a2enmod rewrite \
    && apt-get install inetutils-ping -y

USER phpuser

CMD ["/bin/bash"]