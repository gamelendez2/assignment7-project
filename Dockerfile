FROM fedora:latest 
# By default containers are running as root 
RUN mkdir /structure \
&& useradd collin \
&& chmod 777 /structure 
USER sync 
RUN mkdir /structure/sync-work 
USER nobody
RUN mkdir /structure/nobody-work
USER root 
RUN dnf -yqq install httpd
ADD index.html /var/www/html/index.html
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND