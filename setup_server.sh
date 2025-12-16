#!/bin/bash

# 1. Load variabel dari file .env (jika ada)
if [ -f .env ]; then
	set -a
	source .env
	set +a
else
	echo "[WARNING] File .env tidak ditemukan! Menggunakan default setting."
fi

# 2. Menangkap Argument Pertama dari terminal
# Jika user tidak kasih nama ($1 kosong), pakai default "Default App"
APP_NAME=${1:-"Default App"}
CURRENT_DATE=$(date)

echo "-----------------------------------"
echo "Setup dimulai untuk: $APP_NAME"
echo "Database User: $DB_USER"
echo "Database Port: $DB_PORT"
echo "-----------------------------------"

echo "[PROCESS] Menyiapkan environment..."
sleep 1

# Cek apakah file log 'install.log' sudah ada
if [ -f "logs/install.log" ]; then
	echo "[INFO] File log ditemukan."
else
	echo "[INFO] File log dibuat."
	mkdir -p logs
	touch logs/install.log
fi

# Tulis waktu install ke dalam log
echo "[$CURRENT_DATE] Setup sukses untuk aplikasi: $APP_NAME oleh user: $DB_USER" >> logs/install.log

echo "[SUCCESS] Selesai!"

