FROM registry.cn-beijing.aliyuncs.com/hefan/php:7.2

RUN set -xe \
    && apk add --no-cache --update nginx supervisor \
    && mkdir -p /usr/local/nginx/logs

ADD conf/supervisord.conf /etc/supervisord.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html
ENTRYPOINT [""]
RUN chmod -R 755 /var/www/html

EXPOSE 443 80
CMD ["sh","/var/www/html/start.sh"]