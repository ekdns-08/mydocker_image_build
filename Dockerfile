# FROM nginx:latest
# LABEL maintainer "Author <Author@localhost.com>"
# ADD index.html /usr/share/nginx/html


FROM nginx:latest

RUN rm /usr/share/nginx/html/index.html

RUN echo '<!DOCTYPE html>' > /usr/share/nginx/html/index.html \
    && echo '<html>' >> /usr/share/nginx/html/index.html \
    && echo '<head>' >> /usr/share/nginx/html/index.html \
    && echo '<title>Nginx Version</title>' >> /usr/share/nginx/html/index.html \
    && echo '</head>' >> /usr/share/nginx/html/index.html \
    && echo '<body>' >> /usr/share/nginx/html/index.html \
    && echo '<h1>1. Nginx Server Version:</h1>' >> /usr/share/nginx/html/index.html \
    && nginx -v 2>&1 | sed 's/nginx version: //g' >> /usr/share/nginx/html/index.html \
    && echo '</body>' >> /usr/share/nginx/html/index.html \
    && echo '</html>' >> /usr/share/nginx/html/index.html

RUN touch /tmp/new-version

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
