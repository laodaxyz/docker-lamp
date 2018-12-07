FROM laodaxyz/php:7.2.9

RUN set -xe \
    && apk add --no-cache --update nginx supervisor \
    && mkdir -p /usr/local/nginx/logs

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY index.php /var/www/html/index.php
COPY docker-start.sh /usr/local/bin/docker-start.sh

ENTRYPOINT [""]

EXPOSE 443 80
CMD ["sh","/usr/local/bin/docker-start.sh"]