FROM ubuntu
  


ENV TZ Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
apt install -y apache2 php7.2 \
libapache2-mod-php7.2 \
php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-xml \
php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-sqlite3 php7.2-zip \
net-tools vim


RUN echo "ServerSignature Off" >> /etc/apache2/apache2.conf
RUN echo "ServerTokens Prod" >> /etc/apache2/apache2.conf

RUN a2enmod rewrite
RUN apache2ctl restart

CMD /usr/sbin/apache2ctl -D FOREGROUND
