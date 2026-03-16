FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH

RUN wget -qO /usr/bin/cloudflared $(wget -qO- https://api.github.com/repos/cloudflare/cloudflared/releases | jq -r '[.[].assets[] | select( .name | test("cloudflared-'${TARGETOS}'-'${TARGETARCH}'"; "i"))][0] | .browser_download_url') \
    && chmod u+x /usr/bin/cloudflared

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
      org.opencontainers.image.title="cloudflared" \
      org.opencontainers.image.description="cloudflared ($VERSION on alpine:$ALPINE_VERSION)"

ENV NO_AUTOUPDATE=true

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

COPY --from=build /usr/bin/cloudflared /usr/bin/cloudflared

USER app

ENTRYPOINT ["cloudflared"]
CMD ["-h"]
