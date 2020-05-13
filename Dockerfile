FROM nginx:stable

RUN apt-get update && apt-get install -y supervisor

RUN apt-get clean && rm -rf /var/cache/apt/archives/*

ADD nginx_supervisord /etc/supervisor/conf.d/nginx_supervisord.conf

ADD ptah-api-nginx.conf /etc/nginx/conf.d/ptah-api-nginx.conf

ADD checksha.sh /usr/local/bin/checksha

RUN chmod +x /usr/local/bin/checksha

ENTRYPOINT ["/usr/bin/supervisord"]

STOPSIGNAL SIGQUIT
