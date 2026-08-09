FROM docker.io/library/debian:trixie-slim

ENV TZ=EST \
	USER=1000

LABEL org.opencontainers.image.source=https://github.com/taytom258/valheim-container \
	  org.opencontainers.image.title=valheim-container \
	  org.opencontainers.image.description="Containerized Valheim Server" \
	  org.opencontainers.image.licenses=GPL-3.0

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		tzdata \
		curl \
		ca-certificates \
		tini \
		nano \
		lib32gcc-s1 \
		libatomic1 \
		libpulse-dev \
		libpulse0 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd -s /bin/bash -m -u 1000 steam \
	&& mkdir -p /data/logs \
	&& chown -R 1000:1000 /data /home/steam
	
COPY --chown=1000:1000 --chmod=771 scripts/setup.sh /home/steam/setup.sh
COPY --chown=1000:1000 --chmod=771 scripts/run.sh /home/steam/run.sh

STOPSIGNAL SIGINT

VOLUME /data

USER 1000:1000
WORKDIR /home/steam

ENTRYPOINT ["tini", "-g", "--", "bash"]
CMD ["/home/steam/setup.sh", "896660"]