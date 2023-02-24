FROM alpine AS build

ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache --update jq
RUN env
RUN wget -qO /usr/bin/cloudflared $(wget -qO- https://api.github.com/repos/cloudflare/cloudflared/releases | jq -r '[.[].assets[] | select( .name | test("cloudflared-'${TARGETOS}'-'${TARGETARCH}'"; "i"))][0] | .browser_download_url')
RUN chmod u+x /usr/bin/cloudflared

FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>
COPY --from=build /usr/bin/cloudflared /usr/bin/cloudflared

ENTRYPOINT ["cloudflared"]
CMD ["-h"]
