FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH TARGETVARIANT

RUN wget -qO airconnect.zip $(wget -qO- https://api.github.com/repos/philippe44/AirConnect/releases | jq -r '[.[].assets[] | select( .name | test("AirConnect*"; "i"))][0] | .browser_download_url')
RUN unzip airconnect.zip -d /usr/bin aircast-${TARGETOS}-${TARGETARCH/amd64/x86_64}-static airupnp-${TARGETOS}-${TARGETARCH/amd64/x86_64}-static
RUN mv "/usr/bin/aircast-${TARGETOS}-${TARGETARCH/amd64/x86_64}-static" /usr/bin/aircast
RUN mv "/usr/bin/airupnp-${TARGETOS}-${TARGETARCH/amd64/x86_64}-static" /usr/bin/airupnp
RUN chmod u+x /usr/bin/aircast /usr/bin/airupnp

FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"
COPY --from=build /usr/bin/aircast /usr/bin/aircast
COPY --from=build /usr/bin/airupnp /usr/bin/airupnp

ENTRYPOINT ["aircast"]
CMD ["-h"]

