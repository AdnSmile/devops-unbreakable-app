# 1. Ambil bahan dasar: Python versi ringan (Alpine Linux)
FROM python:3.9-alpine

# 2. Tentukan folder kerja di dalam container
WORKDIR /app

# 3. Copy daftar belanjaan (requirements) ke dalam container
COPY requirements.txt .

# 4. Install belanjaan tersebut di dalam container
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy sisa kode aplikasi (app.py) ke dalam container
COPY . .

# 6. Beritahu Docker bahwa aplikasi ini berjalan di port 5000
EXPOSE 500

# 7. Perintah yang dijalankan saat container menyala
CMD ["python", "app.py"]
