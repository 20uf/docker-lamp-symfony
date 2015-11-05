FROM 20uf/lap-symfony
MAINTAINER Michael COULLERET <michael.coulleret@gmail.com>

RUN apt-get update

ENV PMA_SECRET          blowfish_secret
ENV PMA_USERNAME        develop
ENV PMA_PASSWORD        password
ENV MYSQL_USERNAME      mysql
ENV MYSQL_PASSWORD      dev
ENV PHPMYADMIN_VERSION	4.5.0.2
ENV MAX_UPLOAD			"50M"

# Install MySQL
RUN apt-get install -y mysql-server mysql-client libmysqlclient-dev

RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && tar -xvjf /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 -C / \
 && rm /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && rm -r /www \
 && mv /phpMyAdmin-${PHPMYADMIN_VERSION}-english /www

ADD template/config.inc.php /
ADD template/create_user.sql /
ADD template/phpmyadmin-start /usr/local/bin/
ADD template/phpmyadmin-firstrun /usr/local/bin/

RUN chmod +x /usr/local/bin/phpmyadmin-start
RUN chmod +x /usr/local/bin/phpmyadmin-firstrun

RUN sed -i "s/http {/http {\n        client_max_body_size $MAX_UPLOAD;/" /etc/nginx/nginx.conf
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = $MAX_UPLOAD/" /etc/php5/fpm/php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = $MAX_UPLOAD/" /etc/php5/fpm/php.ini

EXPOSE 80
EXPOSE 3306

CMD phpmyadmin-start