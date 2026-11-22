FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Amiibo Forge" \
      org.opencontainers.image.description="Convierte copias .bin de amiibo (NTAG215) en archivos listos para el Chameleon Ultra" \
      org.opencontainers.image.source="https://github.com/twindragon97/amiibo-forge" \
      org.opencontainers.image.licenses="MIT"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY web/ /usr/share/nginx/html/

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1
