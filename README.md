# WAT

Offers the [whoami Docker image](https://hub.docker.com/r/traefik/whoami) but with a self signed certificate to test TLS terminations

## Usage

```bash
docker run -p 443:443 ghcr.io/eugenmayer/whoami-tls:0.1.0
curl -k https://localhost
```
