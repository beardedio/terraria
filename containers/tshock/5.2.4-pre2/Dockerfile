FROM mcr.microsoft.com/dotnet/runtime:6.0

# Update and install needed utils
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

RUN cd /tmp && \
    curl -sL https://github.com/Pryaxis/TShock/releases/download/v5.2.4-pre2/TShock-Beta-linux-x64-Release.zip --output tshock_release.zip && \
    unzip tshock_release.zip -d /tmp/tshock && \
    cd /tmp/tshock && \
    mkdir ./untar && tar -xf *.tar -C ./untar && \
    cd $(find . -type f -name TShock.Server -printf '%h\n') && \
    mv ./* /tshock/ && \
    rm -R /tmp/*

COPY run-tshock.sh /tshock/run.sh

# Metadata
ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/beardedio/terraria"
LABEL org.opencontainers.image.source=https://github.com/beardedio/terraria
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.description="Tshock Terraria Server - Version 5.2.4-pre2"
LABEL TSHOCK_VERSION=5.2.4-pre2

# Allow for external data
VOLUME ["/config", "/tshock/ServerPlugins"]

# Run the server
WORKDIR /tshock
ENTRYPOINT ["./run.sh"]
