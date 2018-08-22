# Набор 1

Для упрощения установки рабочего окружения.  

### Папка code

Является домашней директорией хоста.

### Папка db

Хранит конфигурационные файлы базы данных MySQL и файлы баз данных.

### Папка nginx

Хранит конфигурационные файлы web сервера NGINX и настройки хоста.

### Папка php

Хранит конфигурационные файлы PHP и докерфайл сборки.
Так как php скрипты запускаются под пользователем *www-data*, что не является удобным, 
в файле *www.conf* необходимо указать своего пользователя и группу.

```ini
user = konstantin
group = konstantin
```

В докерфайле этот момент учтен

### Файл .env

Содержит значения переменных которые можно использовать в файле docker-compose.  

### Файл .gitignore

Содержит перечисление файлов и папок которые нужно скрыть от GITа.

### Файл  docker-compose.yml

Содержит в себе настройки запуска контейнеров и позволяет запустить их одной командой.

### Файл README.md

Содержит данное описание.



Запускать в папке где находится файл docker-compose

Посмотреть полученную конфигурацию на основе файла docker-compose

```
sudo docker-compose config
```

Собрать и запустить контейнеры

```
sudo docker-compose up --build
```

Список всех контейнеров

```
sudo docker ps -a 
```

Удалить все контейнеры

```
sudo docker rm $(sudo docker ps -a -q) 
```

Открыть терминал контейнера host_php_1

```
sudo docker exec -ti host_php_1 bash 
```

Список образов

```
sudo docker images 
```

Удалить один образ по его id

```
sudo docker rmi bf7708291ccb 
```

Остановить запущенные контейнеры

```
sudo docker stop host_phpmyadmin_1 host_php_1 host_db_1 
```

Установить через композер фреймворк Yii2

```
sudo docker-compose run --rm composer composer create-project --prefer-dist --stability=dev yiisoft/yii2-app-basic basic
```

Узнать id пользователя и его группы

```
id $(whoami)
```
