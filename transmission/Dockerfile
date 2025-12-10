FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

ARG PUID=1000
ARG PGID=1000
RUN addgroup -S -g ${PGID} app && adduser -S -u ${PUID} -G app app

RUN apk add --no-cache --update transmission-daemon curl transmission-cli docker-cli bash jq

USER app

RUN wget -qO- https://github.com/Secretmapper/combustion/archive/release.tar.gz | tar -xz -C $HOME
ENV TRANSMISSION_WEB_HOME="/$HOME/combustion-release"

ENTRYPOINT ["transmission-daemon"]
CMD ["-h"]
