FROM debian:bullseye-slim

# Instala dependências
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libjpeg-dev \
    imagemagick \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Clona e compila o mjpg-streamer
WORKDIR /opt
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git
WORKDIR /opt/mjpg-streamer/mjpg-streamer-experimental
RUN make

# Define entrada padrão
ENTRYPOINT ["./mjpg_streamer"]
