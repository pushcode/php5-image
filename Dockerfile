FROM pushcode/nginx

RUN apt-get update -q && \
    apt-get install -yq --no-install-recommends \
        php5-fpm \
        php5-cli \
        php5-mysql \
        php5-json \
        php5-curl \
        curl && \

    # Cleanup
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

ADD default.conf /etc/nginx/sites-available/default

RUN echo "<?php phpinfo(); ?>" > /var/www/phpinfo.php
