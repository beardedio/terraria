FROM mono:slim

# Update and install a zip utility
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl nuget vim zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create symbolic link to ServerLog.txt
RUN mkdir /config /tshock && \
    touch /config/ServerLog.txt && \
    ln -s /config/ServerLog.txt /tshock/ServerLog.txt && \
    rm -rf /config

# fix for favorites.json error
RUN favorites_path="/root/My Games/Terraria" && mkdir -p "$favorites_path" && echo "{}" > "$favorites_path/favorites.json"

# Download and install TShock
# Build Num: 968
# Build URL: https://ci.appveyor.com/project/hakusaro/tshock/builds/32924612

RUN cd /tmp && \
    curl -sL https://ci.appveyor.com/api/buildjobs/5lt1c5fh3ore09f4/artifacts/TShockAPI%2Fbin%2FTShockAVRelease.zip --output tshock_release.zip && \
    unzip tshock_release.zip -d /tshock && \
    rm -R /tmp/* && \
    chmod +x /tshock/TerrariaServer.exe

COPY run-tshock.sh /tshock/run.sh

# Commit Hash Metadata
ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/beardedio/terraria"

# Allow for external data
VOLUME ["/config", "/tshock/ServerPlugins"]

# Run the server
WORKDIR /tshock
CMD ["./run.sh"]
