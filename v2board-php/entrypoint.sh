set -e

cd /www/v2board/

sh /generate_env.sh

chmod -R 777 $(pwd)
php-fpm
