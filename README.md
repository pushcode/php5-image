# PHP-FPM Docker image

    docker build -t pushcode/php5 .
    docker run -p 80 -d pushcode/php5 sh -c 'service php5-fpm start && nginx'