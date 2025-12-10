FROM alpine
LABEL maintainer="Massimiliano Cannarozzo <massi@massi.dev>"

RUN apk add --no-cache --update openvpn iptables openssl

COPY ./run /sbin/run
COPY ./server.conf /etc/openvpn/server.conf.dist

VOLUME /etc/openvpn

EXPOSE 1194/udp

CMD ["run"]
