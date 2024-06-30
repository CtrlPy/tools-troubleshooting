# Use Alpine as the base image for a minimal footprint
FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
    postgresql-client \
    bash \
    curl \
    jq \
    micro \
    net-tools \
    bind-tools \
    iputils \
    tcpdump \
    htop \
    strace \
    iftop \
    iperf3 \
    netcat-openbsd \
    traceroute

# Create a script for showing available tools
RUN echo '#!/bin/bash' > /usr/local/bin/tools && \
    echo 'cat << "EOF"' >> /usr/local/bin/tools && \
    echo '**********' >> /usr/local/bin/tools && \
    echo '* DevOps Tools *' >> /usr/local/bin/tools && \
    echo '**********' >> /usr/local/bin/tools && \
    echo '' >> /usr/local/bin/tools && \
    echo 'Developed by: @ctrlpy' >> /usr/local/bin/tools && \
    echo '' >> /usr/local/bin/tools && \
    echo 'Available tools:' >> /usr/local/bin/tools && \
    echo '- psql (PostgreSQL client)' >> /usr/local/bin/tools && \
    echo '- curl' >> /usr/local/bin/tools && \
    echo '- jq' >> /usr/local/bin/tools && \
    echo '- micro' >> /usr/local/bin/tools && \
    echo '- net-tools' >> /usr/local/bin/tools && \
    echo '- bind-tools' >> /usr/local/bin/tools && \
    echo '- iputils' >> /usr/local/bin/tools && \
    echo '- tcpdump' >> /usr/local/bin/tools && \
    echo '- htop' >> /usr/local/bin/tools && \
    echo '- strace' >> /usr/local/bin/tools && \
    echo '- iftop' >> /usr/local/bin/tools && \
    echo '- dig' >> /usr/local/bin/tools && \
    echo '- iperf3' >> /usr/local/bin/tools && \
    echo '- nc (netcat)' >> /usr/local/bin/tools && \
    echo '- traceroute' >> /usr/local/bin/tools && \
    echo '' >> /usr/local/bin/tools && \
    echo 'EOF' >> /usr/local/bin/tools && \
    chmod +x /usr/local/bin/tools

# Set the working directory
WORKDIR /workspace

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
