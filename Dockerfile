FROM nginx:latest

RUN mkdir -p /certs

# Generate 5-year (1825 days) self-signed cert for test.local with SAN
RUN openssl req -x509 -nodes -days 1825 \
    -newkey rsa:2048 \
    -keyout /certs/test.local.key \
    -out /certs/test.local.crt \
    -subj "/CN=test.local" \
    -addext "subjectAltName=DNS:test.local"

FROM traefik/whoami

COPY --from=0 /certs /certs

EXPOSE 443

CMD ["--cert","/certs/test.local.crt", "--key","/certs/test.local.key", "--port","443"]
