FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk add --no-cache --update transmission-daemon curl transmission-cli docker-cli bash jq

ENTRYPOINT ["transmission-daemon"]
CMD ["-h"]
