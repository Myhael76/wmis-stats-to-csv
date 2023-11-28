FROM alpine

RUN apk --no-cache add --update gettext unzip &&\
    adduser -D author &&\
    mkdir -p /mnt/scripts /mnt/data &&\
    chown author:author /mnt/scripts /mnt/data

USER author

VOLUME "/mnt/scripts" "/mnt/data"
