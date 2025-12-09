FROM python:alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir subliminal

USER app

ENTRYPOINT ["subliminal"]
CMD ["--help"]
