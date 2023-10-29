#!/bin/sh
echo "Created by Endkind Ender (www.endkind.net)"
while true; do
    java -Xms$MIN_RAM -Xmx$MAX_RAM $JAVA_FLAGS -jar /endkind/server.jar $WATERFALL_FLAGS --nogui
done