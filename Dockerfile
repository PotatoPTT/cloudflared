FROM gcr.io/distroless/base-debian13:nonroot

ARG TARGETPLATFORM

COPY --chown=65532:65532 ${TARGETPLATFORM}/cloudflared /usr/local/bin/cloudflared

USER 65532:65532

ENV NO_AUTOUPDATE=true
ENV TUNNEL_ORIGIN_CERT=/etc/cloudflared/cert.pem

ENTRYPOINT ["cloudflared"]
CMD ["version"]

LABEL org.opencontainers.image.source="https://github.com/PotatoPTT/cloudflared"
LABEL org.opencontainers.image.description="Cloudflare Tunnel (cloudflared) multi-arch (linux/amd64, linux/arm64, linux/arm/v7)"
LABEL org.opencontainers.image.licenses="Apache-2.0"
