FROM alpine

ARG BUILD_DATE
ARG REVISION
ARG VERSION

LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Massimiliano Cannarozzo <massi@massi.dev>" \
      org.opencontainers.image.url="https://github.com/maxcanna/dockerfiles" \
      org.opencontainers.image.documentation="https://github.com/maxcanna/dockerfiles/blob/master/README.md" \
      org.opencontainers.image.source="https://github.com/maxcanna/dockerfiles" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.revision=$REVISION \
      org.opencontainers.image.vendor="Massimiliano Cannarozzo" \
      org.opencontainers.image.licenses="GPL-3.0-only" \
      org.opencontainers.image.title="transmission" \
      org.opencontainers.image.description="transmission (latest version on alpine:latest)"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

RUN apk add --no-cache --update transmission-daemon curl transmission-remote docker-cli bash jq

USER app

RUN wget -qO- https://github.com/Secretmapper/combustion/archive/release.tar.gz | tar -xz -C $HOME
ENV TRANSMISSION_WEB_HOME="/home/app/combustion-release"

ENTRYPOINT ["transmission-daemon"]
CMD ["-h"]
