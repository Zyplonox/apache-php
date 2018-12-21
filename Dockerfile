FROM ubuntu
  

ENV TZ Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
apt install -y apache2 php7.2 \
libapache2-mod-php7.2 \
php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-xml \
php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-sqlite3 php7.2-zip 

RUN echo "ServerSignature Off" >> /etc/apache2/apache2.conf
RUN echo "ServerTokens Prod" >> /etc/apache2/apache2.conf
RUN echo "TraceEnable Off" >> /etc/apache2/apache2.conf
RUN echo "<Directory />" >> /etc/apache2/apache2.conf
RUN echo "Options -indexes -Includes" >> /etc/apache2/apache2.conf 
RUN echo "AllowOverride None" >> /etc/apache2/apache2.conf
RUN echo "Require all denied" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf 
RUN echo "<Directory /var/www/html>" >> /etc/apache2/apache2.conf
RUN echo "Options -indexes -Includes" >> /etc/apache2/apache2.conf 
RUN echo "Order deny,allow" >> /etc/apache2/apache2.conf
RUN echo "Allow from all" >> /etc/apache2/apache2.conf
RUN echo "AllowOverride All" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf
RUN echo "Protocols h2 h2c http/1.1" >> /etc/apache2/apache2.conf

RUN a2disconf security

RUN a2enmod rewrite

WORKDIR /var/www/html

CMD /usr/sbin/apache2ctl -D FOREGROUND
