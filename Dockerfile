FROM registry.access.redhat.com/ubi7/ubi
LABEL description="Mi primer containerfile paint"
MAINTAINER Maite maite.rasche@bizkaia.eus
USER root
RUN yum install -y httpd && \
    yum clean all
EXPOSE 8080
COPY index.html flow.js main.js perlin.js utils.js /var/www/html
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf 
RUN chgrp -R 0 /var/log/httpd /var/run/httpd && chmod -R g=u /var/log/httpd /var/run/httpd
USER 1001
ENTRYPOINT ["httpd","-D","FOREGROUND"] 
