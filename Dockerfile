FROM caddy:2.7.6-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.0.16 \
    --with github.com/greenpau/caddy-trace@v1.1.8 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
