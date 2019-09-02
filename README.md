# apache-php

Simple up to date Apache image with PHP

Timezone is Europe/Berlin

http2 is active

Apache mod 'rewrite' is on
ServerSignature=Off
ServerTokens=Prod
Directory Listing is disabled

docker run -t -d -p 80:80 -v /var/www/html:/var/www/html zyplonox/apache-php
