# apache-php

Simple up to date Apache image with PHP

Timezone is Europe/Berlin

http2 is active

Pre installed software:
https://pastebin.com/Zu76hbDH

Apache mod 'rewrite' is on
ServerSignature=Off
ServerTokens=Prod
Directory Listing is disabled

docker run -t -d -p 127.0.0.1:<target_port>:80 -v <source_webroot>:/var/www/html zyplonox/apache-php
