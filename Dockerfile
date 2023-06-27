FROM debian:bookworm
RUN apt update && apt install -y apt-transport-https gpg curl

# Add deb sources for tor
RUN echo "deb https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list
RUN echo "deb-src https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list

# Install all the tor keys
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import && \
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

# Install tor
RUN apt update && \
    apt install -y tor deb.torproject.org-keyring

CMD ["tor"]