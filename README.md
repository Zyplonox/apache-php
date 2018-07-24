# apache-php

A simple Apache2 Webserver with php7.2

Pre installed software:
https://pastebin.com/7RZSyCjm

Apache mod 'rewrite' is on
ServerSignature=Off
ServerTokens=Prod
Directory Listing is disabled

docker run -t -d -p 127.0.0.1:<target_port>:80 -v <source_webroot>:/var/www/html zyplonox/apache-php7.2
