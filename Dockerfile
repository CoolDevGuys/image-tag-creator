FROM alpine:3.13.5

RUN apk add --no-cache bash

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
