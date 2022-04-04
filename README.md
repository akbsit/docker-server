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

## Сервер

### Запустить

```bash
make local-start
```

### Остановить

```bash
make local-stop
```

### Перезапустить

```bash
make local-restart
```

### Пересобрать

Пересобирает контейра

```bash
make local-rebuild
```

### Открыть консоль workspace

```bash
make docker-bash
```

### Посмотреть статус контейнеров

```bash
make docker-status
```

## Настройки

### Просмотреть

#### Список параметров команды

 Название | Тип | Описание
:-------|:-------------|:--------
path | string | Путь до файла настроек

```bash
ansible-vault view --vault-id password <path>
```

#### Пример выполнения команды

```bash
ansible-vault view --vault-id password ansible/vars/global/vault.yml
```

### Расшифровать

#### Список параметров команды

 Название | Тип | Описание
:-------|:-------------|:--------
path | string | Путь до файла настроек

```bash
ansible-vault decrypt --vault-id password <path>
```

#### Пример выполнения команды

```bash
ansible-vault decrypt --vault-id password ansible/vars/global/vault.yml
```

### Зашифровать

#### Список параметров команды

 Название | Тип | Описание
:-------|:-------------|:--------
path | string | Путь до файла настроек

```bash
ansible-vault encrypt --vault-id password <path>
```

#### Пример выполнения команды

```bash
ansible-vault encrypt --vault-id password ansible/vars/global/vault.yml
```
