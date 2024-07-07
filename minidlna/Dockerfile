FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

RUN apk add --no-cache --update minidlna

ENTRYPOINT ["minidlnad"]
CMD ["-h"]
