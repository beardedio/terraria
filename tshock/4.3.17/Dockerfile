FROM mono

# Update and install a zip utility
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim wget zip && \
    apt-get clean

# Create symbolic link to ServerLog.txt
RUN mkdir /config /tshock && \
    touch /config/ServerLog.txt && \
    ln -s /config/ServerLog.txt /tshock/ServerLog.txt && \
    rm -rf /config

# fix for favorites.json error
RUN favorites_path="/root/My Games/Terraria" && mkdir -p "$favorites_path" && echo "{}" > "$favorites_path/favorites.json"

# Download and install TShock
ENV TSHOCK_VERSION=4.3.17

RUN cd /tmp && \
    wget -nv https://github.com/NyxStudios/TShock/releases/download/v$TSHOCK_VERSION/tshock_$TSHOCK_VERSION.zip && \
    unzip tshock_$TSHOCK_VERSION.zip -d /tshock && \
    rm -R /tmp/* && \
    chmod +x /tshock/TerrariaServer.exe

COPY run-tshock.sh /tshock/run.sh

# Allow for external data
VOLUME ["/config", "/tshock/ServerPlugins"]

# Run the server
WORKDIR /tshock
CMD ["./run.sh"]
