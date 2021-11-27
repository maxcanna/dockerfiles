FROM alpine AS build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add --no-cache --update jq go
RUN wget -qO- $(wget -qO- https://api.github.com/repos/caddyserver/xcaddy/releases | jq -r '[.[].assets[] | select( .name | test(".*'${TARGETOS}'_'.?${TARGETARCH}${TARGETVARIANT}'.*gz"; "i"))][0] | .browser_download_url') | tar -xz -C /usr/bin xcaddy
RUN xcaddy build --output /usr/bin/caddy

FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>
COPY --from=build /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]
CMD ["help"]
