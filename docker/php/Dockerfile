FROM php:8.2-fpm-buster
ARG TIMEZONE

COPY php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## Xdebug
#RUN pecl install xdebug-2.5.5; \
#    docker-php-ext-enable xdebug; \
#    echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.remote_autostart = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.default_enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.remote_port = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.remote_host = 0.0.0.0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.var_display_max_children = -1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.var_display_max_data = -1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#    echo "xdebug.var_display_max_depth = -1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
#  fi

WORKDIR /var/www/p2