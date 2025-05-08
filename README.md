
🚀 Deploy проекта search-hotel на Yandex Cloud

1. Склонируйте проект к себе на машину. 🖥️

2. В пакете `/../search-hotel/deploy` найдите файл `terraform.tfvars` и подставьте туда свои данные от Yandex Cloud:
   - Для `yc_token` введите на машине, где есть CLI, команду:
     ```
     yc iam create-token
     ```
   - Для `yc_cloud_id` введите на машине, где есть CLI, команду:
     ```
     yc cloud list
     ```
   - Для `yc_folder_id` введите на машине, где есть CLI, команду:
     ```
     yc folder list
     ```

   Пример конфигурации уже есть внутри файла.

   Документация по CLI: https://yandex.cloud/ru/docs/cli/ 📚

3. Создайте внешний ключ на своей машине командой:
```
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
```

4. Теперь создадим все необходимые ресурсы для работы проекта:
- Откройте пакет `/../search-hotel/deploy` в терминале и введите команды:
  ```
  terraform init
  terraform apply
  ```
- Когда будет предложено, введите `yes`. ✅

Придется подождать 15-20 минут. ⏳

5. Скопируйте хост из команды подключения к кластеру PostgreSQL. Пример:
```
rc1a-5d5jiscjothi8rj3.mdb.yandexcloud.net

```
Подробности можно найти здесь: https://yandex.cloud/ru/docs/managed-postgresql/operations/cluster-list

6. Зайдите по SSH на созданную виртуальную машину:
https://yandex.cloud/ru/docs/compute/operations/vm-connect/ssh 🔑

7. Откройте файл `application.yml` с помощью nano:
```
nano /opt/app/grails-app/conf/application.yml

```
8. В файле замените строку `host` на свой:
```
-url: jdbc:postgresql://your-cluster.mdb.yandexcloud.net:6432/search_hotel_db?ssl=true&sslmode=verify-full&sslrootcert=/home/appuser/.postgresql/root.crt

```
9. Перезапустите ВМ. 🔄

10. Зайдите в созданный кластер и выполните запрос в базу данных `search_hotel_db`. Запрос возьмите полностью из файла `default_value.txt` в проекте.

11. Перейдите по следующей ссылке для доступа к проекту: 🌐
 ```
 https://<публичная ссылка вашей ВМ>:8080 
 ```
