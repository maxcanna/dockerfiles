FROM alpine

ARG BUILD_DATE
ARG REVISION
ARG VERSION
ARG ALPINE_VERSION

LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Massimiliano Cannarozzo <massi@massi.dev>" \
      org.opencontainers.image.url="https://github.com/maxcanna/dockerfiles" \
      org.opencontainers.image.documentation="https://github.com/maxcanna/dockerfiles/blob/master/README.md" \
      org.opencontainers.image.source="https://github.com/maxcanna/dockerfiles" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.revision=$REVISION \
      org.opencontainers.image.vendor="Massimiliano Cannarozzo" \
      org.opencontainers.image.licenses="GPL-3.0-only" \
      org.opencontainers.image.title="openvpn" \
      org.opencontainers.image.description="openvpn ($VERSION on alpine:$ALPINE_VERSION)"

RUN apk add --no-cache --update openvpn iptables openssl

COPY ./run /sbin/run
COPY ./server.conf /etc/openvpn/server.conf.dist

VOLUME /etc/openvpn

EXPOSE 1194/udp

CMD ["run"]
