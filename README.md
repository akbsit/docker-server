# docker-server

Предварительно перед началом работы с сервером необходимо установить: **docker**, **ansible**, **make**.

После запуска сервера, его можно будет увидеть по адрессу `http://localhost/`, отобразиться содержимое файла `./www/index.php`.

> Для настройки сервера, необходимо сконфигурировать файл `./config.yml` и выполнить команду `make local-start`.

## Характеристики по умолчанию

* workspace:
    * `php`;
    * `composer`;
    * `nodejs`;
    * `npm`.
* Nginx - `nginx:alpine`;
* PHP: `7.2`, `7.4`;
* MySQL - `5.6`, `5.7`, `8.0`;
* Redis - `redis:latest`;
* Supervisor;
* Laravel horizon.

## Структура сервера

* `.data` - данные хранящиеся на основной OC и подключаемые в контейнера;
* `ansible` - конфигурационные файлы;
* `service` - подключаемые сервисы;
  * `logs` - логи сервисов;
* `temp` - генерируемые файлы при старте сервера;
* `www` - корневая папка сервера.

## Полезные ссылки

* [localhost:80](http://localhost/);
* [MySql:8081](http://localhost:8081/);
* [redis:6267](http://localhost:6267/).

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
