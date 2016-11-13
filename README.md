# Docker LAMP

> Ubuntu, Apache2, PHP and mysql + phpmyadmin

![Circle CI](https://circleci.com/gh/20uf/docker-lamp-symfony.svg?style=shield&circle-token=:circle-token)

Build image:
---------------

    docker build -t "20uf/docker-lamp-symfony" . 

Run
---------------

    docker run -d -p 80:80 20uf/docker-lamp-symfony -v /your/project:/vhost/current/

Run console mode
---------------

    docker run -p 80:80 -a stdin -a stdout -i -t 20uf/docker-lamp-symfony /bin/bash

## License

Copyright &copy; 2016 [Michael COULLERET aka 20uf](http://github.com/20uf). Licensed under the terms of the [MIT license](LICENSE.md).
