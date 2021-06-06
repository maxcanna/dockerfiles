FROM alpine AS build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add --no-cache --update jq curl go
RUN curl -sL $(curl -s https://api.github.com/repos/caddyserver/xcaddy/releases | jq -r '[.[].assets[] | select( .name | test(".*'${TARGETOS}'_'.?${TARGETARCH}${TARGETVARIANT}'.*gz"; "i"))][0] | .browser_download_url') | tar -xz -C /usr/bin xcaddy
RUN xcaddy build --output /usr/bin/caddy --with github.com/darkweak/souin/plugins/caddy --with github.com/greenpau/caddy-auth-portal

FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>
COPY --from=build /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]
CMD ["help"]
