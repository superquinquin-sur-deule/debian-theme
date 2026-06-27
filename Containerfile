FROM docker.io/library/debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    plymouth \
    plymouth-x11 \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/show-splash.sh /usr/local/bin/show-splash
RUN chmod +x /usr/local/bin/show-splash

ENTRYPOINT ["/usr/local/bin/show-splash"]
