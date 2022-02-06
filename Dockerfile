FROM caddy:2.4.2-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-portal@v1.4.6 \
    --with github.com/greenpau/caddy-auth-jwt@v1.2.7 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.4.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
