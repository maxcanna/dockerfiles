FROM alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk add --no-cache --update transmission-daemon

ENTRYPOINT ["transmission-daemon"]
CMD ["-h"]
