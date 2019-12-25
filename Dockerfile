# 原Nginx包依赖于alpine:3.5
FROM nginx:1.17.6
MAINTAINER Jin<cpp@strcpy.cn>

# 设置时区
RUN echo "Asia/Shanghai" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

#如何设置时区不正确的话可以试试以下方法
#TZ=Asia/Shanghai
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 复制文件到相关的文件夹
COPY docker-file/nginx.conf /etc/nginx/nginx.conf
COPY docker-file/fastcgi_params /etc/nginx/fastcgi_params
COPY docker-file/default.conf /etc/nginx/conf.d

# 创建工作目录
RUN mkdir -p /var/www/app

COPY docker-file/index.php /var/www/app
