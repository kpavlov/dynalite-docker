# dynamodb-local-docker

DynamoDB-Local Docker container with init script. AWS CLI is also installed.

You may mount bash script as `/initdb.sh` to run custom commands after dynamodb instance is started.
You may tune DynamoDB-Local parameters with `DYNAMODB_OPTIONS` environment variable.

Build:

    docker build --force-rm --no-cache -t kpavlov/dynamodb-local .
    
    
Running in docker-compose:

```dicker-compose.sh
version: '3.7'

services:
  dynamodb:
    container_name: kdynamodb
    image: kpavlov/dynamodb-local:latest
    ports:
      - '8000:8000'
    volumes:
    - ./test/initdb.sh:/initdb.sh
```
