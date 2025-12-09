FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH

RUN wget -qO /usr/bin/cloudflared $(wget -qO- https://api.github.com/repos/cloudflare/cloudflared/releases | jq -r '[.[].assets[] | select( .name | test("cloudflared-'${TARGETOS}'-'${TARGETARCH}'"; "i"))][0] | .browser_download_url') \
    && chmod u+x /usr/bin/cloudflared

FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"
COPY --from=build /usr/bin/cloudflared /usr/bin/cloudflared

ENTRYPOINT ["cloudflared"]
CMD ["-h"]
