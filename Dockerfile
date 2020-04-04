FROM dimaqq/dynalite

LABEL maintainer="Konstantin Pavlov <https://github.com/kpavlov>"

ENV AWS_DEFAULT_REGION="us-east-1"
ENV AWS_ACCESS_KEY_ID=fakeMyKeyId
ENV AWS_SECRET_ACCESS_KEY=fakeSecretAccessKey
ENV AWS_CLI_OPTIONS="--endpoint-url http://localhost:8000"

COPY entrypoint.sh  /
COPY initdb.sh  /

ENTRYPOINT "/entrypoint.sh"

RUN apk add --update py-pip  \
    && pip install awscli \
    && rm -rf /var/cache/apk/* \
    && chmod +x entrypoint.sh
