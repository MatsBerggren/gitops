FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive         LANG=C.UTF-8         LC_ALL=C.UTF-8

RUN apt-get update      && apt-get install -y --no-install-recommends         nano net-tools iproute2 iputils-ping dnsutils curl wget         tcpdump mtr-tiny nmap jq less lsof telnet netcat-traditional         openssl iperf3 procps ca-certificates vim-tiny bash-completion      && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-lc"]
CMD echo "Toolbox ready" && sleep infinity
