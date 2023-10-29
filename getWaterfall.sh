#!/bin/bash

WATERFALL_VERSION=${WATERFALL_VERSION:-latest}

LATEST_VERSION_URL="https://api.papermc.io/v2/projects/waterfall"

if [ "$WATERFALL_VERSION" == "latest" ]; then
  LATEST_VERSION=$(curl -s "$LATEST_VERSION_URL" | jq -r '.versions | .[-1]')
else
  LATEST_VERSION="$WATERFALL_VERSION"
fi

if [ -z "$LATEST_VERSION" ]; then
  echo "Konnte keine Informationen zur neuesten Waterfall-Version abrufen."
  exit 1
fi

LATEST_BUILD_URL="https://api.papermc.io/v2/projects/waterfall/versions/$LATEST_VERSION"

LATEST_BUILD=$(curl -s "$LATEST_BUILD_URL" | jq -r '.builds | .[-1]')

if [ -z "$LATEST_BUILD" ]; then
  echo "Konnte keine Informationen zur neuesten Build-Nummer abrufen."
  exit 1
fi

DOWNLOAD_URL="https://api.papermc.io/v2/projects/waterfall/versions/$LATEST_VERSION/builds/$LATEST_BUILD/downloads/waterfall-$LATEST_VERSION-$LATEST_BUILD.jar"

DOWNLOAD_DIR="/endkind"

DESTINATION="$DOWNLOAD_DIR/server.jar"

mkdir -p "$DOWNLOAD_DIR"

curl -o "$DESTINATION" -L "$DOWNLOAD_URL"

if [ $? -eq 0 ]; then
  echo "Neueste Waterfall-Version ($LATEST_VERSION), Build $LATEST_BUILD heruntergeladen und gespeichert unter: $DESTINATION"
else
  echo "Fehler beim Herunterladen der neuesten Waterfall-Version."
  exit 1
fi
