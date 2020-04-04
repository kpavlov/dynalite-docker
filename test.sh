set -e

docker build --force-rm --no-cache -t kpavlov/dynalite:dev .
docker-compose up --remove-orphans --renew-anon-volumes
docker-compose down --force -v
