FROM library/debian:stretch
MAINTAINER kenneth@floss.es
#COPY mifichero.txt /
RUN apt-get update && \
    apt-get -y install apache2 libapache2-mod-php7.0 && \
    rm -rf /var/cache/apt /var/lib/dpkg && \
    sed -e 's:${APACHE_LOG_DIR}/error.log:/dev/stderr:g' -i /etc/apache2/sites-available/000-default.conf && \
    sed -e 's:${APACHE_LOG_DIR}/access.log:/dev/stdout:g' -i /etc/apache2/sites-available/000-default.conf
    
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]


