FROM httpd
RUN yum update -y
COPY index.html /var/www/html
