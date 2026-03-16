FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH TARGETVARIANT

RUN wget -qO- $(wget -qO- https://api.github.com/repos/caddyserver/caddy/releases | jq -r '[.[].assets[] | select( .name | test("caddy_.*_'${TARGETOS}'_'${TARGETARCH}${TARGETVARIANT}'.tar.gz"; "i"))][0] | .browser_download_url') | tar -xz -C /usr/bin caddy \
    && chmod u+x /usr/bin/caddy

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
      org.opencontainers.image.title="caddy" \
      org.opencontainers.image.description="caddy (latest version on alpine:latest)"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

COPY --from=build /usr/bin/caddy /usr/bin/caddy

USER app

ENTRYPOINT ["caddy"]
CMD ["help"]
