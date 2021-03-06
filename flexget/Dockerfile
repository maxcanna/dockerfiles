FROM python:alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk --update --no-cache add gcc g++ libc-dev
RUN pip install --upgrade pip
RUN pip install flexget
RUN apk del gcc g++ libc-dev

ENTRYPOINT ["flexget"]
CMD ["-c", "/etc/issue", "-h"]
