# lamp-symfony
Ubuntu, Apache2, PHP and mysql + phpmyadmin

(https://circleci.com/gh/mcolabs/lamp-symfony.svg?style=shield&circle-token=:circle-token)

Build image:
---------------

    docker build -t "20uf/lamp-symfony" . 

Run
---------------

    docker run -d -p 80:80 20uf/lamp-symfony -v /your/project:/vhost/current/

Run console mode
---------------

    docker run -p 80:80 -a stdin -a stdout -i -t 20uf/lamp-symfony /bin/bash


