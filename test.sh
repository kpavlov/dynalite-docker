docker build --force-rm --no-cache -t kpavlov/dynamodb-local:dev .
docker-compose up --remove-orphans --renew-anon-volumes
docker-compose rm --force -v
