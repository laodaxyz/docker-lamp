FROM php:7.2-fpm-alpine3.8

# redis mongo
RUN apk update \
  ## redis 拓展
    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://pecl.php.net/get/redis | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
  ## mongodb 拓展
    && mkdir -p /usr/src/php/ext/mongodb \
    && curl -L https://pecl.php.net/get/mongodb | tar xvz -C /usr/src/php/ext/mongodb --strip 1 \
    && echo 'mongodb' >> /usr/src/php-available-exts \
  ## 安装拓展
    && docker-php-ext-install opcache pdo_mysql mysqli redis mongodb \
    && rm -rf /usr/src/php

# composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

ENTRYPOINT ["docker-php-entrypoint"]
EXPOSE 9000
CMD ["php-fpm"]