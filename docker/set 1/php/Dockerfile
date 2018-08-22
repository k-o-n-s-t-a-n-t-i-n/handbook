# за основу берем образ PHP 7
FROM php:7-fpm

# копировать c компа в контейнер
#COPY --from=composer /usr/bin/composer /usr/bin/composer

# обновление репозитория в контейнере
RUN apt-get update
# ставим библиотеки для php для работы GD
RUN apt-get install -yqq libfreetype6-dev libpng-dev libjpeg62-turbo-dev

# добавляем драйвер для PDO
RUN docker-php-ext-install pdo pdo_mysql
# конфигурируем и добавляем GD
RUN docker-php-ext-configure gd --with-gd \
                              --with-freetype-dir=/usr/include/ \
                              --with-png-dir=/usr/include/ \
                              --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Для комфортной работы чтобы не менять владельца файлов которые создаст php
# добавляем в контейнер группу совпадающую с группой пользователя ПК
RUN groupadd konstantin
# добавляем в контейнер пользователя совпадающего с аналогичным на ПК
RUN useradd -ms /bin/bash konstantin -g konstantin
