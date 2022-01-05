FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk add --no-cache --update transmission-daemon curl transmission-cli docker-cli bash jq

RUN wget -qO- https://github.com/Secretmapper/combustion/archive/release.tar.gz | tar -xz -C $HOME
ENV TRANSMISSION_WEB_HOME="/root/combustion-release"

ENTRYPOINT ["transmission-daemon"]
CMD ["-h"]
