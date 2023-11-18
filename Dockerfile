FROM eclipse-temurin:latest
RUN apt-get update && apt-get install -y \
    curl \
    jq

LABEL Author Endkind Ender <endkind.ender@endkind.net>

COPY getWaterfall.sh /endkind/getWaterfall.sh
COPY docker-entrypoint.sh /endkind/docker-entrypoint.sh
COPY LICENSE /LICENSE

RUN chmod +x /endkind/getWaterfall.sh
RUN chmod +x /endkind/docker-entrypoint.sh

ARG WATERFALL_VERSION=latest
RUN echo "$WATERFALL_VERSION" > /endkind/waterfall_version

WORKDIR /waterfall

VOLUME /waterfall

ENV MIN_RAM=32M
ENV MAX_RAM=512M
ENV JAVA_FLAGS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
ENV WATERFALL_FLAGS="--nojline"

ENTRYPOINT ["/endkind/docker-entrypoint.sh"]