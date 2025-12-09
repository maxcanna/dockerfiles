FROM python:alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir subliminal

ENTRYPOINT ["subliminal"]
CMD ["--help"]
