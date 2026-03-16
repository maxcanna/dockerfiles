FROM python:alpine

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
      org.opencontainers.image.title="subliminal" \
      org.opencontainers.image.description="subliminal (latest version on alpine:latest)"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir subliminal

USER app

ENTRYPOINT ["subliminal"]
CMD ["--help"]
