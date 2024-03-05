FROM alpine:edge

RUN set -ex; \
    apk add --update --no-cache offlineimap ca-certificates; \
    adduser -D -S imapuser; \
    mkdir -p /home/imapuser/.offlineimap; \
    chown imapuser:nogroup /home/imapuser/.offlineimap;

USER imapuser

LABEL org.opencontainers.image.title=offlineimap \
      org.opencontainers.image.description="OfflineIMAP as a Docker container" \
      org.opencontainers.image.vendor=starina

ENTRYPOINT [ "offlineimap" ]
CMD [ "-c", "/offlineimap.conf" ]
