FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH

RUN wget -qO /usr/bin/cloudflared $(wget -qO- https://api.github.com/repos/cloudflare/cloudflared/releases | jq -r '[.[].assets[] | select( .name | test("cloudflared-'${TARGETOS}'-'${TARGETARCH}'"; "i"))][0] | .browser_download_url') \
    && chmod u+x /usr/bin/cloudflared

FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

COPY --from=build /usr/bin/cloudflared /usr/bin/cloudflared

USER app

ENTRYPOINT ["cloudflared"]
CMD ["-h"]
