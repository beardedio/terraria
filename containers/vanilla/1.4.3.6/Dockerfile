FROM debian:trixie-slim

# Update and install needed utils
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl vim zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# fix for favorites.json error
RUN favorites_path="/root/My Games/Terraria" && mkdir -p "$favorites_path" && echo "{}" > "$favorites_path/favorites.json"

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    curl -sL https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1436.zip --output terraria-server.zip && \
    unzip -q terraria-server.zip && \
    mv */Linux /vanilla && \
    mv */Windows/serverconfig.txt /vanilla/serverconfig-default.txt && \
    rm -R /tmp/* && \
    chmod +x /vanilla/TerrariaServer* && \
    if [ ! -f /vanilla/TerrariaServer ]; then echo "Missing /vanilla/TerrariaServer"; exit 1; fi

COPY run-vanilla.sh /vanilla/run.sh

# Metadata
ARG VCS_REF
LABEL org.opencontainers.image.revision=$VCS_REF
LABEL org.opencontainers.image.source="https://github.com/beardedio/terraria"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.description="Vanilla Terraria Server - Version 1436"
LABEL VANILLA_VERSION=1436

# Allow for external data
VOLUME ["/config"]

# Run the server
WORKDIR /vanilla
ENTRYPOINT ["./run.sh"]
