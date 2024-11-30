FROM php:7.4-apache

LABEL maintainer="rabramley@gmail.com"

RUN apt-get update -qq && \
    apt-get -yq --no-install-recommends install \
    msmtp \
    supervisor \
    cron \
    libpng-dev \
    libzip-dev \
    libldap2-dev \
    curl \
    vim \
    unzip \
    iputils-ping \
    default-mysql-client \
    && docker-php-ext-install gd zip mysqli \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install ldap

# Upload folder
RUN mkdir /edocs/
RUN chown -R www-data:www-data /edocs/

# Supervisord ro run both cron and apache
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

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
