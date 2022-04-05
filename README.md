# docker-server

Предварительно перед началом работы с сервером необходимо установить: **docker**, **ansible**, **make**.

После запуска сервера, его можно будет увидеть по адрессу `http://localhost/`, отобразиться содержимое файла `./www/index.php`.

> Для настройки сервера, необходимо сконфигурировать файл `./config.yml` и выполнить команду `make local-start`.

## Характеристики

* workspace:
    * `php`;
    * `composer`;
    * `nodejs`;
    * `npm`.
* nginx - `nginx:alpine`;
* php: `7.2`, `7.4`, `8.0`;
* mysql - `5.6`, `5.7`, `8.0`;
* redis - `redis:latest`;
* maildev;
* beanstalkd;
* supervisor;
* laravel horizon.

## Структура сервера

* `.data` - данные хранящиеся на основной OC и подключаемые в контейнера;
* `ansible` - конфигурационные файлы;
* `service` - подключаемые сервисы;
* `temp` - генерируемые файлы при старте сервера;
  * `logs` - логи сервисов;
* `www` - корневая папка сервера.

## Полезные ссылки

* [localhost:80](http://localhost/);
* [maildev:8081](http://localhost:1080/).

## Команды управления

* [Сервер](.docs/server/server.md);
* [Настройки сервера](.docs/server/server-settings.md).
