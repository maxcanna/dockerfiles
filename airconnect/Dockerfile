FROM --platform=$BUILDPLATFORM alpine AS build

RUN apk add --no-cache --update jq

ARG TARGETOS TARGETARCH TARGETVARIANT

ENV ARCH=${TARGETARCH/amd64/x86_64}
ENV ARCH=${ARCH/386/x86}
ENV ARCH=${ARCH/arm64/aarch64}

RUN wget -qO airconnect.zip $(wget -qO- https://api.github.com/repos/philippe44/AirConnect/releases | jq -r '[.[].assets[] | select( .name | test("AirConnect*"; "i"))][0] | .browser_download_url') \
    && unzip airconnect.zip -d /usr/bin aircast-${TARGETOS}-${ARCH}-static airupnp-${TARGETOS}-${ARCH}-static \
    && mv "/usr/bin/aircast-${TARGETOS}-${ARCH}-static" /usr/bin/aircast \
    && mv "/usr/bin/airupnp-${TARGETOS}-${ARCH}-static" /usr/bin/airupnp \
    && chmod u+x /usr/bin/aircast /usr/bin/airupnp

FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

COPY --from=build /usr/bin/aircast /usr/bin/aircast
COPY --from=build /usr/bin/airupnp /usr/bin/airupnp

USER app

ENTRYPOINT ["aircast"]
CMD ["-h"]

