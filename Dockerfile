FROM daocloud.io/xss_er/nginx:openresty
MAINTAINER Jin<cpp@strcpy.cn>

# Copy nginx configuration files
COPY docker-file/fastcgi_params /usr/local/openresty/nginx/conf/fastcgi_params
COPY docker-file/nginx.conf     /usr/local/openresty/nginx/conf/nginx.conf
COPY docker-file/default.conf   /usr/local/openresty/nginx/conf/conf.d/default.conf


# add www-data
RUN deluser xfs && \
    addgroup -g 33 -S www-data && adduser -u 33 -D -S -G www-data www-data