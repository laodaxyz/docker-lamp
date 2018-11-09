FROM laodaxyz/php:7.2.9

RUN set -xe \
    && apk add --no-cache --update nginx supervisor \
    && mkdir -p /usr/local/nginx/logs

ADD conf/supervisord.conf /etc/supervisord.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default.conf /etc/nginx/conf.d/default.conf
ADD index.php /var/www/html/index.php
ADD start.sh /user/local/start.sh

WORKDIR /var/www/html
ENTRYPOINT [""]

EXPOSE 443 80
CMD ["sh","/var/www/html/start.sh"]