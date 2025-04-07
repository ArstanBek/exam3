# версия java 17

## для запуска базы 
### docker compose build
### docker compose up

## для подлкючения к базе
### docker exec -it exam3-db psql -U postgres -d exam3

## Проверить есть ли записи в таблице roles
### select * from roles;

## Если нет то ввести 
### INSERT INTO roles VALUES (1, 'ROLE_USER');
### INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

### Бэкап базы данных в файле exam3_backup.sql

### Коллекция Postman в файле user exam.postman_collection.json

