FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH TARGETVARIANT

RUN wget -qO- $(wget -qO- https://api.github.com/repos/caddyserver/caddy/releases | jq -r '[.[].assets[] | select( .name | test("caddy_.*_'${TARGETOS}'_'${TARGETARCH}${TARGETVARIANT}'.tar.gz"; "i"))][0] | .browser_download_url') | tar -xz -C /usr/bin caddy \
    && chmod u+x /usr/bin/caddy

FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"
COPY --from=build /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]
CMD ["help"]
