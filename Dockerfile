FROM alpine:latest

RUN apk update && apk add curl unzip && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && mv xray /usr/bin/xray && chmod +x /usr/bin/xray && \
    mkdir -p /etc/xray /var/log/xray

COPY config.json /etc/xray/config.json

CMD ["xray", "-c", "/etc/xray/config.json"]
