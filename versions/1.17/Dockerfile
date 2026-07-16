FROM python:3.13-slim AS build

ARG VERSION=1.17
ARG BUILD=latest

COPY get-waterfall.py get-waterfall.py
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

RUN python get-waterfall.py --version $VERSION --build $BUILD --output /endkind/server.jar

FROM eclipse-temurin:16 AS runtime

LABEL Author="Endkind Ender <endkind.ender@endkind.net>"

RUN groupadd --system --gid 10001 waterfall \
    && useradd --system --uid 10001 --gid waterfall --home-dir /data --shell /usr/sbin/nologin waterfall \
    && mkdir -p /endkind /data \
    && chown -R waterfall:waterfall /endkind /data

COPY --chown=waterfall:waterfall entrypoint.sh /endkind/entrypoint.sh
RUN chmod +x /endkind/entrypoint.sh

COPY --from=build --chown=waterfall:waterfall /endkind/server.jar /endkind/server.jar

WORKDIR /data
VOLUME /data

ENV MIN_RAM=32M
ENV MAX_RAM=3G
ENV JAVA_FLAGS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
ENV WATERFALL_FLAGS="--nojline"

USER waterfall

ENTRYPOINT [ "/endkind/entrypoint.sh" ]
