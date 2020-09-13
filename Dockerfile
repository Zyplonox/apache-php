FROM ubuntu
  

ENV TZ Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y && apt install -y apache2
RUN apt install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt update
RUN apt install -y php7.4 libapache2-mod-php7.4 \
php7.4-bcmath php7.4-bz2 php7.4-cgi php7.4-cli php7.4-common php7.4-curl php7.4-fpm php7.4-gd php7.4-xml \
php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-sqlite3 php7.4-zip

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
