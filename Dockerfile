FROM nginx
COPY index.html /usr/share/nginx/html
COPY index.html /tmp/index.html
EXPOSE 80 8080 443

