FROM nginx:alpine

RUN apk add --no-cache openssl

# Create cert directory
RUN mkdir -p /etc/nginx/certs

# Generate 5-year (1825 days) self-signed cert for test.local with SAN
RUN openssl req -x509 -nodes -days 1825 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/certs/test.local.key \
    -out /etc/nginx/certs/test.local.crt \
    -subj "/CN=test.local" \
    -addext "subjectAltName=DNS:test.local"

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
