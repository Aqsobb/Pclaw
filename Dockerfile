FROM sipeed/picoclaw:latest

# Reset entrypoint bawaan agar tidak double command
ENTRYPOINT []

# Set host dan paksa port internalnya ke 3000 agar sesuai health check PaaS
ENV PICOCLAW_GATEWAY_HOST=0.0.0.0
ENV PICOCLAW_GATEWAY_PORT=3000
ENV PORT=3000

# Buat direktori dan salin config
RUN mkdir -p /root/.picoclaw/ && mkdir -p /app/docker/data/
COPY config.json /root/.picoclaw/config.json
COPY config.json /app/docker/data/config.json

# Ekspos port 3000 ke jaringan luar
EXPOSE 3000

# Jalankan sub-command gateway yang valid dengan flag --host yang didukung
CMD ["picoclaw", "gateway", "--host", "0.0.0.0"]
