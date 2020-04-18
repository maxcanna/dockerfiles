FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk add --no-cache --update jq curl
RUN curl -sL $(curl -s https://api.github.com/repos/caddyserver/caddy/releases | jq -r '.[0].assets[] | select( .name | contains("linux_armv6")) | .browser_download_url') | tar -xz -C /usr/bin caddy
RUN apk del jq curl

ENTRYPOINT ["caddy"]
CMD ["help"]
