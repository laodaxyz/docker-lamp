FROM php:7.2-fpm-alpine3.8

RUN set -xe \
	&& apk add --no-cache \
		libmemcached \
		libevent \
		nghttp2 \
		cyrus-sasl \
		zlib \
	&& buildDeps=" \
		libmemcached-dev \
		libevent-dev \
		nghttp2-dev \
		libressl-dev \
		cyrus-sasl-dev \
		linux-headers \
		zlib-dev" \
    && apk add --no-cache --update --virtual .build-deps $PHPIZE_DEPS $buildDeps \
	\
	&& docker-php-ext-install opcache \
	&& pecl install memcached-3.0.4 \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
    && pecl install -o -f redis-4.1.1  \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
	&& pecl install -o -f swoole-4.0.4  \
    && echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini \
    && rm -rf /usr/share/php \
    && rm -rf /tmp/* \
    && apk del .build-deps \
	\
	&& curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer


ENTRYPOINT ["docker-php-entrypoint"]
EXPOSE 9000
CMD ["php-fpm"]