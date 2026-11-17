
FROM nginx:alpine

COPY essai.html /usr/share/nginx/html/index.html

EXPOSE 80
