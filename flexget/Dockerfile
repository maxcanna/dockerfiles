FROM python:alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN apk --update --no-cache add gcc g++ libc-dev linux-headers libstdc++
RUN pip install --upgrade pip
RUN pip install flexget
RUN apk del gcc g++ libc-dev linux-headers

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["-c", "/etc/issue", "-h"]
