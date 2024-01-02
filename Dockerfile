ARG VERSION=latest
FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
--with github.com/mholt/caddy-dynamicdns \
--with github.com/caddy-dns/cloudflare \

ARG VERSION
FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
