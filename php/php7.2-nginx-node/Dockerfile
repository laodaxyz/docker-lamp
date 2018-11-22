FROM laodaxyz/php-nginx:7.2.9

RUN set -xe \
    && apk add --no-cache --update nodejs

EXPOSE 443 80
CMD ["sh","/user/local/start.sh"]