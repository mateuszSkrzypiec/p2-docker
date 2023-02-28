if [ "$1" == "on" ]; then
    echo "\nxdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nzend_extension=xdebug.so" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nxdebug.max_nesting_level=9999" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nxdebug.remote_enable=On" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nxdebug.remote_host=$2" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nxdebug.remote_port=$3" >> /usr/local/etc/php/conf.d/xdebug.ini
    echo "\nxdebug.remote_log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini
else
    rm /usr/local/etc/php/conf.d/xdebug.ini
fi