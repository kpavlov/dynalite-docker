FROM azul/zulu-openjdk-alpine:14

RUN apk add --update py-pip \
    && pip install awscli \
    && rm -rf /var/cache/apk/*

ENV DYNAMODB_OPTIONS="-inMemory"
ENV DYNAMODB_PORT="8000"
ENV AWS_DEFAULT_REGION="us-east-1"
ENV AWS_ACCESS_KEY_ID="fakeMyKeyId"
ENV AWS_SECRET_ACCESS_KEY="fakeSecretAccessKey"
ENV AWS_CLI_OPTIONS="--endpoint-url http://localhost:8000"

COPY entrypoint.sh  /
COPY initdb.sh  /

ENTRYPOINT "/entrypoint.sh"

EXPOSE $PORT

# Download and unpack dynamodb.
# Links are from: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
RUN wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz -q -O - | tar -xz
