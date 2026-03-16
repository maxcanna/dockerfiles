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
      org.opencontainers.image.title="ffmpeg" \
      org.opencontainers.image.description="ffmpeg ($VERSION on alpine:$ALPINE_VERSION)"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

RUN apk add --no-cache --update ffmpeg

USER app

ENTRYPOINT ["ffmpeg"]
CMD ["-h"]
