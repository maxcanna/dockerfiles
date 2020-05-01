FROM alpine AS build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add --no-cache --update jq curl
RUN curl -sL $(curl -s https://api.github.com/repos/caddyserver/caddy/releases | jq -r '[.[].assets[] | select( .name | test(".*'${TARGETOS}'_'.?${TARGETARCH}${TARGETVARIANT}'.*gz"; "i"))][0] | .browser_download_url') | tar -xz -C /usr/bin caddy

FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>
COPY --from=build /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]
CMD ["help"]
