#!/bin/sh

# Start supervisord and services(nginx + php-fpm)
exec /usr/bin/supervisord -n -c /etc/supervisord.conf