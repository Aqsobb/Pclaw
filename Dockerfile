FROM sipeed/picoclaw:latest

# Set host ke 0.0.0.0 agar bisa di-binding dari Docker host network
ENV PICOCLAW_GATEWAY_HOST=0.0.0.0

# Buat direktori config bawaan
RUN mkdir -p /root/.picoclaw/ && mkdir -p /app/docker/data/

# Salin konfigurasi ke lokasi yang dibaca aplikasi
COPY config.json /root/.picoclaw/config.json
COPY config.json /app/docker/data/config.json

# --- PILIH SALAH SATU MODE DI BAWAH INI SEBAGAI CMD ---

# OPSI A: Jika ingin menjalankan Web Console / Launcher (Default port internal: 18800)
EXPOSE 18800
CMD ["picoclaw", "launcher", "--host", "0.0.0.0"]

# OPSI B: Jika hanya ingin menjalankan Webhook Gateway (Gunakan ini jika Opsi A tidak ada)
# EXPOSE 8080 
# CMD ["picoclaw", "gateway", "--host", "0.0.0.0"]
