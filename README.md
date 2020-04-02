# DynamoDB-Local Docker Container with AWS CLI

[![](https://images.microbadger.com/badges/image/kpavlov/dynamodb-local.svg)](https://microbadger.com/images/kpavlov/dynamodb-local "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/kpavlov/dynamodb-local.svg)](https://microbadger.com/images/kpavlov/dynamodb-local "Get your own version badge on microbadger.com")

[![DockerHub Badge](http://dockeri.co/image/kpavlov/dynamodb-local)](https://hub.docker.com/r/kpavlov/dynamodb-local)


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
    image: kpavlov/dynamodb-local
    ports:
      - '8000:8000'
    volumes:
    - ./test/initdb.sh:/initdb.sh
```

Run `test.sh` to try it.
