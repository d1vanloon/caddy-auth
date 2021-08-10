FROM caddy:2.4.3-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-portal@v1.4.8 \
    --with github.com/greenpau/caddy-auth-jwt@v1.3.14

FROM caddy:2.4.3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
