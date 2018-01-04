FROM alpine:latest
RUN apk update && apk add curl coreutils && rm -rf /var/cache/apk/*
COPY purge.sh /
CMD /purge.sh
