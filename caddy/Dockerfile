FROM alpine AS build

RUN apk add --no-cache --update jq curl
RUN curl -sL $(curl -s https://api.github.com/repos/caddyserver/caddy/releases | jq -r '.[0].assets[] | select( .name | contains("linux_armv6")) | .browser_download_url') | tar -xz -C /usr/bin caddy

FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>
COPY --from=build /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]
CMD ["help"]
