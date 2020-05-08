FROM arm32v6/alpine:3.11.6
LABEL maintainer="https://github.com/mendhak/docker-arm32v6-chronograf"

EXPOSE 8888

ARG VERSION=1.8.4

RUN wget https://dl.influxdata.com/chronograf/releases/chronograf-${VERSION}_linux_armhf.tar.gz -O chronograf.tar.gz && \
    tar xzvf chronograf.tar.gz && \
    cp chronograf-${VERSION}-1/usr/bin/chronograf /usr/bin/ && \
    cp chronograf-${VERSION}-1/usr/bin/chronoctl /usr/bin/ && \
    rm -rf /chronograf-${VERSION}-1 && \
    rm -f /chronograf.tar.gz


CMD ["chronograf"]