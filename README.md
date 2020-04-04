# Dynalite (DynamoDB Emulator) Docker Container with AWS CLI

[![](https://images.microbadger.com/badges/image/kpavlov/dynalite.svg)](https://microbadger.com/images/kpavlov/dynalite)
[![](https://images.microbadger.com/badges/version/kpavlov/dynalite.svg)](https://microbadger.com/images/kpavlov/dynalite)

[![DockerHub Badge](http://dockeri.co/image/kpavlov/dynalite)](https://hub.docker.com/r/kpavlov/dynalite)

This container runs [Dynalite][dynalite] (Amazon's DynamoDB emulator) with initialization script.
AWS CLI is also installed.

You may mount a shell script as `/initdb.sh` to run custom commands after Dynalite instance is started.
Don't forget to include `$AWS_CLI_OPTIONS` in `aws` command arguments, e.g.:

~~~bash /initdb.sh
aws dynamodb list-tables $AWS_CLI_OPTIONS
~~~

Build:

    docker build --force-rm --no-cache -t kpavlov/dynalite .
    
Running:

    docker run --rm --name dynalite -p 8000:8000 --volume "$(pwd)/test/initdb.sh:/initdb.sh" -it kpavlov/dynalite 
    
Running in docker-compose:

```dicker-compose.yml
version: '3.7'

services:
  dynamodb:
    image: kpavlov/dynalite
    ports:
      - '8000:8000'
    volumes:
    - ./test/initdb.sh:/initdb.sh
```

Run `test.sh` to try it.

[cli-options]: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html#DynamoDBLocal.CommandLineOptions
[dynalite]: https://github.com/mhart/dynalite "An implementation of Amazon's DynamoDB built on LevelDB"
