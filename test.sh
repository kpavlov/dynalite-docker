docker build -t kpavlov/dynamodb-local:latest .
docker-compose up --remove-orphans --renew-anon-volumes
docker-compose rm --force -v
