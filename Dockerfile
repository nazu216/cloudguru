FROM nginx
MAINTAINER nazeefa
COPY welcome.txt /usr/share/nginx/html
EXPOSE 80
