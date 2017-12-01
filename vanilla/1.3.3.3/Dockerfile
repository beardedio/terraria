FROM mono

# Update and install a zip utility
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim wget zip && \
    apt-get clean

# fix for favorites.json error
RUN favorites_path="/root/My Games/Terraria" && mkdir -p "$favorites_path" && echo "{}" > "$favorites_path/favorites.json"

# Download and install TShock
ENV VANILLA_VERSION=1333

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    wget -nv http://terraria.org/server/terraria-server-$VANILLA_VERSION.zip && \
    unzip -q terraria-server-$VANILLA_VERSION.zip && \
    mv */Linux /vanilla && \
    mv */Windows/serverconfig.txt /vanilla/serverconfig-default.txt && \
    rm -R /tmp/* && \
    chmod +x /vanilla/TerrariaServer* && \
    if [ ! -f /vanilla/TerrariaServer ]; then echo "Missing /vanilla/TerrariaServer"; exit 1; fi

COPY run-vanilla.sh /vanilla/run.sh

# Allow for external data
VOLUME ["/config"]

# Run the server
WORKDIR /vanilla
CMD ["./run.sh"]
