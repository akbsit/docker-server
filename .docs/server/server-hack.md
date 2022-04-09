# Something not work, look here

### Host is not allowed to connect to this MySQL server

if you see this error, most likely no users were created to work with database. To make it right, you need to run commands:

Connect to mysql container

```bash
docker-compose exec mysql bash
```

Connect to mysql

```bash
mysql
```

Create default users

```sql
CREATE USER 'root'@'%';
CREATE USER 'user'@'%';
```
