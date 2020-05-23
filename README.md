# docker-sever

Предварительно перед началом работы с сервером необходимо установить: **docker**, **ansible**, **make**.

После запуска сервера, его можно будет увидеть по адрессу `http://localhost/`, отобразиться содержимое файла `./www/index.php`.

> Для изменения настроек сервера, необходимо отредактировать файл `./config.yml` и пересобрать.

## Характеристики по умолчанию

* workspace:
    * `php`;
    * `composer`.
* Nginx - `nginx:alpine`;
* PHP - `phpdockerio/php72-fpm:latest`;
* MySQL - `mysql:latest`.

## Полезные ссылки

* [localhost:80](http://localhost/);
* [MySql:8081](http://localhost:8081/).

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