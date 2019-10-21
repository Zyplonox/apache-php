FROM debian:buster-slim

ENV TZ Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y

RUN apt install -y apache2 php7.3 libapache2-mod-php7.3 \
php7.3-bcmath php7.3-bz2 php7.3-cgi php7.3-cli php7.3-common php7.3-curl php7.3-fpm php7.3-gd php7.3-xml \
php7.3-json php7.3-ldap php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-sqlite3 php7.3-zip

RUN echo 'ServerSignature Off \n\
ServerTokens Prod \n\
TraceEnable Off \n\
<Directory /> \n\
Options -indexes -Includes \n\
AllowOverride None \n\
Require all denied \n\
</Directory> \n\
<Directory /var/www/html> \n\
Options -indexes -Includes \n\
Order deny,allow \n\
Allow from all \n\
AllowOverride All \n\
</Directory> \n\
Protocols h2 h2c http/1.1' >> /etc/apache2/apache2.conf

RUN a2disconf security
RUN a2enmod http2 rewrite

WORKDIR /var/www/html

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
