# Docker

На основе репозитория [eon01/DockerCheatSheet](https://github.com/eon01/DockerCheatSheet)


## Докерхаб

### Войти

```
docker login
```

```
docker login localhost:8080
```

### Выйти 

```
docker logout
```

```
docker logout localhost:8080
```

### Поиск образа

```
docker search nginx
```

```
docker search --filter stars=3 --no-trunc nginx
```

### Получить образ

```
docker image pull nginx
```

```
docker image pull eon01/nginx localhost:5000/myadmin/nginx
```

### Опубликовать образ

```
docker image push eon01/nginx
```

```
docker image push eon01/nginx localhost:5000/myadmin/nginx
```

## Контейнеры

```
docker container run --name infinite -it -p 3000:80 -v ${PWD}:/data ubuntu:latest
```

### Создать контейнер

```
docker container create -t -i eon01/infinite --name infinite
```

### Запустить контейнер

```
docker container run -it --name infinite -d eon01/infinite
```

### Переименовать

```
docker container rename infinite infinity
```

### Удалить

```
docker container rm infinite
```

### Обновить

```
docker container update --cpu-shares 512 -m 300M infinite
```

### Старт

```
docker container start nginx
```

### Стоп
```
docker container stop nginx
```

### Перезапустить
```
docker container restart nginx
```

### Пауза
```
docker container pause nginx

```

### Снятие с паузы

```
docker container unpause nginx
```

### Блокировка

```
docker container wait nginx
```

### Отправить SIGKILL

```
docker container kill nginx
```

### Отправить другой сигнал

```
docker container kill -s HUP nginx
```

### Подключение к существующему контейнеру

```
docker container attach nginx
```


## Получение инфы о контейнерах

### Запущенные

```
docker container ls
```

```
docker container ls -a
```

### Логи

```
docker logs infinite
```

### Follow Container Logs

```
docker container logs infinite -f
```

### Инспекция

```
docker container inspect infinite
```

```
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker ps -q)
```

### События

```
docker system events infinite
```

### Публичные порты

```
docker container port infinite
```

### Запущенные процессы

```
docker container top infinite
```

### Занятые ресурсы (стата)

```
docker container stats infinite
```

### Проверка изменений файлов или каталогов в файловой системе контейнера

```
docker container diff infinite
```


### Действия с образами

### Список

```
docker image ls
```

### Собрать образ

```
docker build .
```

```
docker build github.com/creack/docker-firefox
```

```
docker build - < Dockerfile
```

```
docker build - < context.tar.gz
```

```
docker build -t eon/infinite .
```

```
docker build -f myOtherDockerfile .
```

```
curl example.com/remote/Dockerfile | docker build -f - .
```



### Удалить

```
docker image rm nginx
```

### Загрузка образа из файла или стандартного входного потока

```
docker image load < ubuntu.tar.gz
```

```
docker image load --input ubuntu.tar
```

### Сохранить как Tar Archive

```
docker image save busybox > ubuntu.tar
```

### История

```
docker image history
```

### Создать образ из контейнера

```
docker container commit nginx
```

### Сделать метку

```
docker image tag nginx eon01/nginx
```

### Опубликовать (запушить)

```
docker image push eon01/nginx
```


## Сеть

### Создание сети

```
docker network create -d overlay MyOverlayNetwork
```

```
docker network create -d bridge MyBridgeNetwork
```

```
docker network create -d overlay \
  --subnet=192.168.0.0/16 \
  --subnet=192.170.0.0/16 \
  --gateway=192.168.0.100 \
  --gateway=192.170.0.100 \
  --ip-range=192.168.1.0/24 \
  --aux-address="my-router=192.168.1.5" --aux-address="my-switch=192.168.1.6" \
  --aux-address="my-printer=192.170.1.5" --aux-address="my-nas=192.170.1.6" \
  MyOverlayNetwork
```

### Удалить сеть

```
docker network rm MyOverlayNetwork
```

### Список

```
docker network ls
```

### Информация о сети

```
docker network inspect MyOverlayNetwork
```

### Подключение бегущего контейнера к сети

```
docker network connect MyOverlayNetwork nginx
```

### Подключение контейнера к сети при запуске

```
docker container run -it -d --network=MyOverlayNetwork nginx
```

### Отключение контейнера от сети

```
docker network disconnect MyOverlayNetwork nginx
```

### Показ портов

Используя Dockerfile, вы можете открыть порт в контейнере, используя:

```
EXPOSE <port_number>
```

Вы также можете сопоставить порт контейнера с хост-портом, используя:

```
docker run -p $HOST_PORT:$CONTAINER_PORT --name infinite -t infinite
```

## Очистка

### Удалить запущенный контейнер

```
docker container rm nginx
```

### Удаление контейнера и его тома

```
docker container rm -v nginx
```

### Удаление всех завершенных контейнеров

```
docker container rm $(docker container ls -a -f status=exited -q)
```


### Удаление всех остановленных контейнеров

```
docker container rm `docker container ls -a -q`
```

### Удаление образа

```
docker image rm nginx
```

### Удаление оборванных изображений

```
docker image rm $(docker image ls -f dangling=true -q)
```

### Удалить все образы

```
docker image rm $(docker image ls -a -q)
```

### Удаление всех немаркированных образов

```
docker image rm -f $(docker image ls | grep "^<none>" | awk "{print $3}")
```

### Остановить и удалить все контейнеры

```
docker container stop $(docker container ls -a -q) && docker container rm $(docker container ls -a -q)
```

### Удаление болтающихся томов

```
docker volume rm $(docker volume ls -f dangling=true -q)
```

### Удалить все не используемое (containers, images, networks and volumes)

```
docker system prune -f
```

### Очистить всё

```
docker system prune -a
```

## Рой

### Установить рой

```
curl -ssl https://get.docker.com | bash
```


### Инициализация

```
docker swarm init --advertise-addr 192.168.10.1
```


### Заставить Работника присоединиться к Рою

```
docker swarm join-token worker
```


### Получение менеджера для объединения роя

```
docker swarm join-token manager
```



### Список служб

```
docker service ls
```


### Список узлов

```
docker node ls
```


### Создать службу

```
docker service create --name vote -p 8080:80 instavote/vote
```


### Список задач Роя

```
docker service ps
```


### Масштабирование службы


```
docker service scale vote=3
```


### Обновление службы

```
docker service update --image instavote/vote:movies vote
```

```
docker service update --force --update-parallelism 1 --update-delay 30s nginx
```

```
docker service update --update-parallelism 5--update-delay 2s --image instavote/vote:indent vote
```

```
docker service update --limit-cpu 2 nginx
```

```
docker service update --replicas=5 nginx
```
