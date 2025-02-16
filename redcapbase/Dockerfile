FROM php:8.3-apache

LABEL maintainer="rabramley@gmail.com"

RUN a2enmod rewrite

RUN apt-get update -qq && \
    apt-get -yq --no-install-recommends install \
    msmtp \
    supervisor \
    cron \
    libpng-dev \
    libzip-dev \
    libldap2-dev \
    ghostscript \
    libmagickwand-dev \
    curl \
    wget \
    vim \
    unzip \
    iputils-ping \
    default-mysql-client \
    && docker-php-ext-install gd zip mysqli \
    && rm -r /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/Imagick/imagick/archive/944b67fce68bcb5835999a149f917670555b6fcb.tar.gz | tar xvz -C /tmp \
    && yes '' | pecl install /tmp/imagick-944b67fce68bcb5835999a149f917670555b6fcb/package.xml \
    && docker-php-ext-enable imagick

RUN sed -i 's/policy\ domain=\"coder\" rights=\"none\" pattern=\"PDF\"/policy domain=\"coder\" rights=\"read\" pattern=\"PDF\"/g' /etc/ImageMagick-6/policy.xml

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install ldap

# Upload folder
RUN mkdir /edocs/
RUN chown -R www-data:www-data /edocs/

# Supervisord ro run both cron and apache
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Apache config
ADD 000-default.conf /etc/apache2/sites-enabled/

# Suggested PHP config changes
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN sed -i.bak 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' $PHP_INI_DIR/php.ini
RUN sed -i.bak 's/post_max_size = 8M/post_max_size = 32M/g' $PHP_INI_DIR/php.ini
RUN sed -i.bak 's/;max_input_vars = 1000/max_input_vars = 100000/g' $PHP_INI_DIR/php.ini
RUN sed -i.bak 's/;error_log = php_errors.log/error_log = php_errors.log/g' $PHP_INI_DIR/php.ini
RUN sed -i.bak "s/;session.cookie_secure =/session.cookie_secure = On/g" $PHP_INI_DIR/php.ini

# Mail Configuration
RUN echo 'sendmail_path = "/usr/bin/msmtp -t -i"' > /usr/local/etc/php/conf.d/mail.ini
# ADD msmtprc /etc/msmtprc

# Copy in REDCap files
ADD redcap*.zip /var/www/redcap/
RUN unzip /var/www/redcap/redcap*.zip -d /var/www/redcap/
RUN rm /var/www/redcap/redcap*.zip
ADD database.php /var/www/redcap/redcap/
ADD ldap_config.php /var/www/redcap/redcap/webtools2/ldap/ldap_config.php

RUN ln -s /var/www/redcap/redcap/hook_functions.php /var/www/html/

# Configure temp directory
RUN chmod 777 -R /var/www/redcap/redcap/temp
RUN chown -fR www-data:www-data /var/www/redcap/redcap/modules/ || exit 0
RUN chown www-data /var/www/redcap/redcap/webtools2/ldap/ldap_config.php
