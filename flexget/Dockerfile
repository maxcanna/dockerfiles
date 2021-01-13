FROM python:alpine
LABEL maintainer Massimiliano Cannarozzo <massi@massi.dev>

RUN pip install --upgrade pip
RUN pip install flexget

ENTRYPOINT ["flexget"]
CMD ["-c", "/etc/issue", "-h"]
